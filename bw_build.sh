while [[ $# -gt 0 ]] ; do
    key="$1"
    case $key in
        --stack_name)
            STACK_NAME="$2"
            shift
            ;;
        --profile)
            PROFILE="$2"
            shift
            ;;
    esac
    shift
done

if [ -z ${STACK_NAME+x} ]; then
  echo "--stack_name parameter is required!"
  exit 1
fi

cd ./source/constructs
npm run clean:install
STACK_NAME=$STACK_NAME overrideWarningsEnabled=false npx cdk bootstrap $(if [ -z ${PROFILE+x} ]; then echo ""; else echo "--profile ${PROFILE}"; fi)