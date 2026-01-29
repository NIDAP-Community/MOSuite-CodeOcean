#!/usr/bin/env nextflow
// hash:sha256:389992b9ccac95d8f2dce6ee14e754b826fa5f9c54209faeaf33c8bac35b7e6e

// capsule - MOSuite - create multiOmicDataSet
process capsule_mosuite_create_multiomicdataset_4 {
	tag 'capsule-6541445'
	container "$REGISTRY_HOST/published/5ce5f88d-980d-4e61-b3a4-ef4a0ce48030:v5"

	cpus 1
	memory '7.5 GB'

	output:
	path 'capsule/results/*', emit: to_capsule_mosuite_clean_raw_counts_5_1

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

	ln -s "/tmp/data/nidap-1.0" "capsule/data/nidap-1.0" # id: bd9a7518-66cb-4d50-9992-df3271aeb807

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git clone --filter=tree:0 --branch v5.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6541445.git" capsule-repo
	else
		git clone --branch v5.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6541445.git" capsule-repo
	fi
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_mosuite_create_multiomicdataset_4_args}

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MOSuite - clean raw counts
process capsule_mosuite_clean_raw_counts_5 {
	tag 'capsule-5801113'
	container "$REGISTRY_HOST/published/ab07963e-d9e0-489e-b776-70f6ef2ef73b:v3"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mosuite_filter_low_counts_6_2

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
		git clone --filter=tree:0 --branch v3.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-5801113.git" capsule-repo
	else
		git clone --branch v3.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-5801113.git" capsule-repo
	fi
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_mosuite_clean_raw_counts_5_args}

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MOSuite - filter low counts
process capsule_mosuite_filter_low_counts_6 {
	tag 'capsule-4565215'
	container "$REGISTRY_HOST/published/0296f612-3498-4ed0-ac13-50620e45d67d:v1"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mosuite_normalize_counts_7_3

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=0296f612-3498-4ed0-ac13-50620e45d67d
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git clone --filter=tree:0 --branch v1.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-4565215.git" capsule-repo
	else
		git clone --branch v1.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-4565215.git" capsule-repo
	fi
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_mosuite_filter_low_counts_6_args}

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MOSuite - normalize counts
process capsule_mosuite_normalize_counts_7 {
	tag 'capsule-9169525'
	container "$REGISTRY_HOST/published/75561d95-aa78-4140-b64d-ddae5b64fc39:v1"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mosuite_batch_correct_counts_8_4

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=75561d95-aa78-4140-b64d-ddae5b64fc39
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git clone --filter=tree:0 --branch v1.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-9169525.git" capsule-repo
	else
		git clone --branch v1.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-9169525.git" capsule-repo
	fi
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_mosuite_normalize_counts_7_args}

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MOSuite - batch correct counts
process capsule_mosuite_batch_correct_counts_8 {
	tag 'capsule-1373453'
	container "$REGISTRY_HOST/published/065804a2-efa7-43f2-9692-967bf0d6b592:v1"

	cpus 1
	memory '7.5 GB'

	publishDir "$RESULTS_PATH", saveAs: { filename -> new File(filename).getName() }

	input:
	path 'capsule/data/'

	output:
	path 'capsule/results/*'

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=065804a2-efa7-43f2-9692-967bf0d6b592
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git clone --filter=tree:0 --branch v1.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-1373453.git" capsule-repo
	else
		git clone --branch v1.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-1373453.git" capsule-repo
	fi
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_mosuite_batch_correct_counts_8_args}

	echo "[${task.tag}] completed!"
	"""
}

workflow {
	// run processes
	capsule_mosuite_create_multiomicdataset_4()
	capsule_mosuite_clean_raw_counts_5(capsule_mosuite_create_multiomicdataset_4.out.to_capsule_mosuite_clean_raw_counts_5_1.collect())
	capsule_mosuite_filter_low_counts_6(capsule_mosuite_clean_raw_counts_5.out.to_capsule_mosuite_filter_low_counts_6_2.collect())
	capsule_mosuite_normalize_counts_7(capsule_mosuite_filter_low_counts_6.out.to_capsule_mosuite_normalize_counts_7_3.collect())
	capsule_mosuite_batch_correct_counts_8(capsule_mosuite_normalize_counts_7.out.to_capsule_mosuite_batch_correct_counts_8_4.collect())
}
