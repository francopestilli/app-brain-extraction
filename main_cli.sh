#!/bin/bash
SCRIPT=$(realpath -s "$0"); SCRIPT_DIR=$(dirname "$SCRIPT")

usage() {
    echo "Usage: $(basename $0) --t1 <path> [--frac <0-1>] [--robust] [--bias-neck-cleanup]"
    exit 1
}

t1=""; frac=0.5; robust=false; bias_neck_cleanup=false

while [[ $# -gt 0 ]]; do
    case "$1" in
        --t1)                t1=$(realpath "$2");         shift 2 ;;
        --frac)              frac="$2";                   shift 2 ;;
        --robust)            robust=true;                 shift   ;;
        --bias-neck-cleanup) bias_neck_cleanup=true;      shift   ;;
        -h|--help)           usage ;;
        *) echo "Unknown argument: $1"; usage ;;
    esac
done

[ -z "$t1" ] && { echo "Error: --t1 required" >&2; exit 1; }
[ ! -f "$t1" ] && { echo "Error: not found: $t1" >&2; exit 1; }

cat > config.json <<EOF
{
  "t1":                $(jq -n --arg v "$t1" '$v'),
  "frac":              $frac,
  "robust":            $robust,
  "bias_neck_cleanup": $bias_neck_cleanup
}
EOF

echo "config.json written:"; cat config.json; echo ""
bash "${SCRIPT_DIR}/main"
