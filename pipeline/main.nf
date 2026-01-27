#!/usr/bin/env nextflow
// hash:sha256:e60c74eb0db9870da170bd3833dbe435cba6b383333fc48223204b0a17b1e6f0

// capsule - MOSuite-create
process capsule_mosuite_create_2 {
	tag 'capsule-6541445'
	container "$REGISTRY_HOST/published/5ce5f88d-980d-4e61-b3a4-ef4a0ce48030:v2"

	cpus 1
	memory '7.5 GB'

	output:
	path 'capsule/results/*', emit: to_capsule_mosuite_clean_1_1

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=5ce5f88d-980d-4e61-b3a4-ef4a0ce48030
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git clone --filter=tree:0 --branch v2.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6541445.git" capsule-repo
	else
		git clone --branch v2.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6541445.git" capsule-repo
	fi
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_mosuite_create_2_args}

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MOSuite-clean
process capsule_mosuite_clean_1 {
	tag 'capsule-5801113'
	container "$REGISTRY_HOST/published/ab07963e-d9e0-489e-b776-70f6ef2ef73b:v1"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=ab07963e-d9e0-489e-b776-70f6ef2ef73b
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git clone --filter=tree:0 --branch v1.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-5801113.git" capsule-repo
	else
		git clone --branch v1.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-5801113.git" capsule-repo
	fi
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_mosuite_clean_1_args}

	echo "[${task.tag}] completed!"
	"""
}

workflow {
	// run processes
	capsule_mosuite_create_2()
	capsule_mosuite_clean_1(capsule_mosuite_create_2.out.to_capsule_mosuite_clean_1_1)
}
