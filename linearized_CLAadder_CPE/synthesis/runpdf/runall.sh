# bash script to run pdf_tool for and archive all report files with extend .rpt in this directory
# the script can accept one argument to specify the netlist name
# and will check if the archive directory is existing, if not, the directory will be created

# Usage: ./runall [-a|--archive=path] [-p|--plot] [-t|--time=double]
# -a|--archive select the archive directory, if not specified, the results will be in the current directory and will not be achived
# -p|--plot select whether open matlab, and automatically run plot_all.m script to plot the pdf and cdf figures
# -t|--time specify the simulation time that pass to pdf_tool

archive_dir="."
plot=0;
sim_time=10;

# Parsing arguments
for i in "$@"
do
case $i in
    -a=*|--archive=*)
    archive_dir="${i#*=}"
    shift # past argument=value
    ;;
    -p|--plot)
    plot=1
    shift # past argument=value
    ;;
    -st=*|--simtime=*)
	sim_time="${i#*=}"
	shift
	;;
    *)
            # unknown option
    ;;
esac
done

if [ $archive_dir == "" ]; then
	echo "the switch -a is given but without an acceptable path after ="
	exit 1
fi

if [ ! -f *.rpt ]; then
	echo "no report file found"
	exit 1
fi

for i in $(ls *.rpt); do
	filename=${i##* /}
	filebasename=${i%.*}
	./pdf_tool ${sim_time} $i $filebasename.dat
done

./combine.plx

if [ $plot -ne 0 ]; then
	echo "data is ready, opening Matlab for plotting..."
	echo "don't do anyting until the script quit!!"
	matlab -nodesktop -r "run('plot_all.m')"
fi

# if argument is applied
if [ $archive_dir != "." ]; then
    if [ ! -d $archive_dir ]; then
  		mkdir $archive_dir
	fi
	mv *.rpt $archive_dir
	mv *.dat $archive_dir
	if [ -f pdf_cdf.pdf ]; then
		mv pdf_cdf.pdf $archive_dir
	fi
	mv *.txt $archive_dir
fi

echo "script complete successfully!!!"