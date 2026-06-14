case "$1" in
    build_generator)
        docker build -f Dockerfile.generator -t generator-image .
        ;;
    run_generator)
        docker run --rm -v $(pwd)/data:/data generator-image
        ;;
    create_local_data)
        mkdir -p local_data
        python generate.py $(pwd)/local_data
        ;;
    build_reporter)
        docker build -f Dockerfile.reporter -t reporter-image .
        ;;
    run_reporter)
        docker run --rm -v $(pwd)/data:/data reporter-image
        ;;
    structure)
        find . -type f | sort
        ;;
    clear_data)
        rm -f data/*.csv data/*.html
        ;;
    inside_generator)
        docker run --rm -v $(pwd)/data:/data generator-image cat /data/data.csv
        ;;
    inside_reporter)
        docker run --rm -v $(pwd)/data:/data reporter-image cat /data/report.html
        ;;
    report_server)
        docker run --rm -d -p 8080:80 -v $(pwd)/data:/usr/share/nginx/html:ro nginx
        ;;
    *)
        echo "Команды: build_generator, run_generator, create_local_data, build_reporter, run_reporter, structure, clear_data, inside_generator, inside_reporter, report_server"
        ;;
esac