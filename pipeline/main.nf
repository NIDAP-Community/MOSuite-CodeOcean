#!/usr/bin/env nextflow
// hash:sha256:633287ba5a231d596dc7b609c41534f27eaec9e159b5f53312b41c4cd11ae9ee

// capsule - MOSuite - create multiOmicDataSet
process capsule_mosuite_create_multiomicdataset_4 {
	tag 'capsule-2543295'
	container "$REGISTRY_HOST/capsule/1d6bde8f-5f58-40b9-8133-6ea2156d5b02:48e7c7a2092005352c3de6bb27945664"

	cpus 1
	memory '7.5 GB'

	output:
	path 'capsule/results/*', emit: to_capsule_mosuite_clean_raw_counts_8_3

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=1d6bde8f-5f58-40b9-8133-6ea2156d5b02
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	ln -s "/tmp/data/nidap-1.0" "capsule/data/nidap-1.0" # id: bd9a7518-66cb-4d50-9992-df3271aeb807

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-2543295.git" capsule-repo
	else
		git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-2543295.git" capsule-repo
	fi
	git -C capsule-repo checkout 1da50426da33695c8f5a91ad5d21ff302fdf66db --quiet
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
process capsule_mosuite_clean_raw_counts_8 {
	tag 'capsule-9989765'
	container "$REGISTRY_HOST/capsule/275d525b-a6f5-44d3-98d1-72a2b8fa9f3c:48e7c7a2092005352c3de6bb27945664"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mosuite_filter_low_counts_6_1

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=275d525b-a6f5-44d3-98d1-72a2b8fa9f3c
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-9989765.git" capsule-repo
	else
		git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-9989765.git" capsule-repo
	fi
	git -C capsule-repo checkout 00418ae8b9032d4ce46741b3a6da33a236896ffa --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_mosuite_clean_raw_counts_8_args}

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MOSuite - filter low counts
process capsule_mosuite_filter_low_counts_6 {
	tag 'capsule-2922767'
	container "$REGISTRY_HOST/capsule/34ccaa24-827d-4ab1-a707-a3d7710abfa6:48e7c7a2092005352c3de6bb27945664"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mosuite_normalize_counts_7_2
	path 'capsule/results/*', emit: to_capsule_mosuite_differential_expression_analysis_10_5

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=34ccaa24-827d-4ab1-a707-a3d7710abfa6
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-2922767.git" capsule-repo
	else
		git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-2922767.git" capsule-repo
	fi
	git -C capsule-repo checkout aea9f61f096eb162ca05423b137268af30268ca6 --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_mosuite_filter_low_counts_6_args}

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MOSuite - differential expression analysis
process capsule_mosuite_differential_expression_analysis_10 {
	tag 'capsule-9971852'
	container "$REGISTRY_HOST/capsule/20681ac6-cb5c-4cb3-8b70-d2d35a4a57d3:48e7c7a2092005352c3de6bb27945664"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mosuite_filter_differential_expression_results_11_6

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=20681ac6-cb5c-4cb3-8b70-d2d35a4a57d3
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-9971852.git" capsule-repo
	else
		git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-9971852.git" capsule-repo
	fi
	git -C capsule-repo checkout eb9bb8654c41454da9393efb39b075ee446db66c --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_mosuite_differential_expression_analysis_10_args}

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MOSuite - normalize counts
process capsule_mosuite_normalize_counts_7 {
	tag 'capsule-6680510'
	container "$REGISTRY_HOST/capsule/3ee00838-8eaa-414c-bfa9-c2f8e607b2ae:48e7c7a2092005352c3de6bb27945664"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mosuite_batch_correct_counts_9_4
	path 'capsule/results/*', emit: to_capsule_mosuite_plot_expression_heatmap_12_7
	path 'capsule/results/*', emit: to_capsule_mosuite_plot_2_d_pca_13_8
	path 'capsule/results/*', emit: to_capsule_mosuite_plot_3_d_pca_14_9

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=3ee00838-8eaa-414c-bfa9-c2f8e607b2ae
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6680510.git" capsule-repo
	else
		git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6680510.git" capsule-repo
	fi
	git -C capsule-repo checkout dc5748a4ca64d37a198ad6b3beab0cd767a9f27d --quiet
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
process capsule_mosuite_batch_correct_counts_9 {
	tag 'capsule-8049145'
	container "$REGISTRY_HOST/capsule/2eae5a71-36a6-44e2-a3b2-2cd5634b445d:48e7c7a2092005352c3de6bb27945664"

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

	export CO_CAPSULE_ID=2eae5a71-36a6-44e2-a3b2-2cd5634b445d
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-8049145.git" capsule-repo
	else
		git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-8049145.git" capsule-repo
	fi
	git -C capsule-repo checkout 20c082a76dfa497edbac1eabf3ca394190215fc0 --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_mosuite_batch_correct_counts_9_args}

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MOSuite - filter differential expression
process capsule_mosuite_filter_differential_expression_results_11 {
	tag 'capsule-8221739'
	container "$REGISTRY_HOST/capsule/1231d6b7-b591-4efa-a1b9-821425d54d8a:48e7c7a2092005352c3de6bb27945664"

	cpus 1
	memory '7.5 GB'

	publishDir "$RESULTS_PATH", saveAs: { filename -> new File(filename).getName() }

	input:
	path 'capsule/data/'

	output:
	path 'capsule/results/*'
	path 'capsule/results/*', emit: to_capsule_mosuite_plot_volcano_enhanced_15_10
	path 'capsule/results/*', emit: to_capsule_mosuite_plot_volcano_summary_16_11
	path 'capsule/results/*', emit: to_capsule_mosuite_plot_venn_diagram_17_12

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=1231d6b7-b591-4efa-a1b9-821425d54d8a
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-8221739.git" capsule-repo
	else
		git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-8221739.git" capsule-repo
	fi
	git -C capsule-repo checkout 8e44d8929659bc82848a18a1edd5723a341cbf7f --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_mosuite_filter_differential_expression_results_11_args}

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MOSuite - plot 2D PCA
process capsule_mosuite_plot_2_d_pca_13 {
	tag 'capsule-0166328'
	container "$REGISTRY_HOST/capsule/64e9c322-1a38-4e54-9bf6-965ca3b0c4c3:48e7c7a2092005352c3de6bb27945664"

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

	export CO_CAPSULE_ID=64e9c322-1a38-4e54-9bf6-965ca3b0c4c3
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-0166328.git" capsule-repo
	else
		git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-0166328.git" capsule-repo
	fi
	git -C capsule-repo checkout 9c7198585b4bd6c2b01cbadbbd325ef4813d57fd --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_mosuite_plot_2_d_pca_13_args}

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MOSuite - plot 3D PCA
process capsule_mosuite_plot_3_d_pca_14 {
	tag 'capsule-3838154'
	container "$REGISTRY_HOST/capsule/a160b105-3084-46fc-8cc9-02886fd4bacb:48e7c7a2092005352c3de6bb27945664"

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

	export CO_CAPSULE_ID=a160b105-3084-46fc-8cc9-02886fd4bacb
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-3838154.git" capsule-repo
	else
		git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-3838154.git" capsule-repo
	fi
	git -C capsule-repo checkout c7a904144f770af28bd08bae91e36ae2e3bf53fe --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_mosuite_plot_3_d_pca_14_args}

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MOSuite - plot expression heatmap
process capsule_mosuite_plot_expression_heatmap_12 {
	tag 'capsule-6385174'
	container "$REGISTRY_HOST/capsule/b1c2220e-36e5-4592-a3a7-4a50ed5f9fca:48e7c7a2092005352c3de6bb27945664"

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

	export CO_CAPSULE_ID=b1c2220e-36e5-4592-a3a7-4a50ed5f9fca
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6385174.git" capsule-repo
	else
		git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6385174.git" capsule-repo
	fi
	git -C capsule-repo checkout 2184ab214d95e361b3db938e153684f99afadd83 --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_mosuite_plot_expression_heatmap_12_args}

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MOSuite - Plot Venn Diagram
process capsule_mosuite_plot_venn_diagram_17 {
	tag 'capsule-0361730'
	container "$REGISTRY_HOST/capsule/fc79457f-e98b-4446-af20-6a47ac21bfc4:48e7c7a2092005352c3de6bb27945664"

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

	export CO_CAPSULE_ID=fc79457f-e98b-4446-af20-6a47ac21bfc4
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-0361730.git" capsule-repo
	else
		git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-0361730.git" capsule-repo
	fi
	git -C capsule-repo checkout 8bc11db1cc07323ad04c8e6559b49c43390d3fa7 --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_mosuite_plot_venn_diagram_17_args}

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MOSuite - Plot Volcano Enhanced
process capsule_mosuite_plot_volcano_enhanced_15 {
	tag 'capsule-0997557'
	container "$REGISTRY_HOST/capsule/1ed73516-2eb1-4bcf-919e-bb2f03664fb2:48e7c7a2092005352c3de6bb27945664"

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

	export CO_CAPSULE_ID=1ed73516-2eb1-4bcf-919e-bb2f03664fb2
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-0997557.git" capsule-repo
	else
		git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-0997557.git" capsule-repo
	fi
	git -C capsule-repo checkout b889f36e190d58e04371485ff9e6c9f495f94e6e --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_mosuite_plot_volcano_enhanced_15_args}

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MOSuite - Plot Volcano Summary
process capsule_mosuite_plot_volcano_summary_16 {
	tag 'capsule-9325734'
	container "$REGISTRY_HOST/capsule/49efd716-f3b6-4d75-a62a-0f61bed2e75b:48e7c7a2092005352c3de6bb27945664"

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

	export CO_CAPSULE_ID=49efd716-f3b6-4d75-a62a-0f61bed2e75b
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-9325734.git" capsule-repo
	else
		git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-9325734.git" capsule-repo
	fi
	git -C capsule-repo checkout e4e95bddcae0b5849a6a27f8ba508ee59aa82e5c --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_mosuite_plot_volcano_summary_16_args}

	echo "[${task.tag}] completed!"
	"""
}

workflow {
	// run processes
	capsule_mosuite_create_multiomicdataset_4()
	capsule_mosuite_clean_raw_counts_8(capsule_mosuite_create_multiomicdataset_4.out.to_capsule_mosuite_clean_raw_counts_8_3.collect())
	capsule_mosuite_filter_low_counts_6(capsule_mosuite_clean_raw_counts_8.out.to_capsule_mosuite_filter_low_counts_6_1.collect())
	capsule_mosuite_differential_expression_analysis_10(capsule_mosuite_filter_low_counts_6.out.to_capsule_mosuite_differential_expression_analysis_10_5.collect())
	capsule_mosuite_normalize_counts_7(capsule_mosuite_filter_low_counts_6.out.to_capsule_mosuite_normalize_counts_7_2.collect())
	capsule_mosuite_batch_correct_counts_9(capsule_mosuite_normalize_counts_7.out.to_capsule_mosuite_batch_correct_counts_9_4)
	capsule_mosuite_filter_differential_expression_results_11(capsule_mosuite_differential_expression_analysis_10.out.to_capsule_mosuite_filter_differential_expression_results_11_6.collect())
	capsule_mosuite_plot_2_d_pca_13(capsule_mosuite_normalize_counts_7.out.to_capsule_mosuite_plot_2_d_pca_13_8.collect())
	capsule_mosuite_plot_3_d_pca_14(capsule_mosuite_normalize_counts_7.out.to_capsule_mosuite_plot_3_d_pca_14_9.collect())
	capsule_mosuite_plot_expression_heatmap_12(capsule_mosuite_normalize_counts_7.out.to_capsule_mosuite_plot_expression_heatmap_12_7.collect())
	capsule_mosuite_plot_venn_diagram_17(capsule_mosuite_filter_differential_expression_results_11.out.to_capsule_mosuite_plot_venn_diagram_17_12.collect())
	capsule_mosuite_plot_volcano_enhanced_15(capsule_mosuite_filter_differential_expression_results_11.out.to_capsule_mosuite_plot_volcano_enhanced_15_10.collect())
	capsule_mosuite_plot_volcano_summary_16(capsule_mosuite_filter_differential_expression_results_11.out.to_capsule_mosuite_plot_volcano_summary_16_11.collect())
}
