Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id AC129529AE
	for <meta-arago@arago-project.org>;
	Tue, 19 May 2015 17:37:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4JHblYH029527
	for <meta-arago@arago-project.org>; Tue, 19 May 2015 12:37:47 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4JHbliu019178
	for <meta-arago@arago-project.org>; Tue, 19 May 2015 12:37:47 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 19 May 2015 12:37:47 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4JHblRf021022;
	Tue, 19 May 2015 12:37:47 -0500
Date: Tue, 19 May 2015 13:37:46 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <hzhang@ti.com>
Message-ID: <20150519173746.GU31845@edge>
References: <1431987744-8557-1-git-send-email-hzhang@ti.com>
MIME-Version: 1.0
In-Reply-To: <1431987744-8557-1-git-send-email-hzhang@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [Re-submit: V2] kexec-tools: add kexec fast reboot tools for Keystone
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Tue, 19 May 2015 17:37:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, May 18, 2015 at 06:22:24PM -0400, hzhang@ti.com wrote:
> From: Hao Zhang <hzhang@ti.com>
> 
> This recipe adds kexec fast reboot tools (based on v2.0.7) with a patch
> to resolve aliased address issue for Keystone II devices.
> 
> Signed-off-by: Hao Zhang <hzhang@ti.com>
> ---
>  ...01-kexec-ks2-use-KS2-aliased-addresses-on.patch |  273 ++++++++++++++++++++
>  .../recipes-kernel/kexec/kexec-tools_2.0.7.bb      |   18 ++
>  2 files changed, 291 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-kernel/kexec/kexec-tools-2.0.7/0001-kexec-ks2-use-KS2-aliased-addresses-on.patch
>  create mode 100644 meta-arago-extras/recipes-kernel/kexec/kexec-tools_2.0.7.bb
> 
> diff --git a/meta-arago-extras/recipes-kernel/kexec/kexec-tools-2.0.7/0001-kexec-ks2-use-KS2-aliased-addresses-on.patch b/meta-arago-extras/recipes-kernel/kexec/kexec-tools-2.0.7/0001-kexec-ks2-use-KS2-aliased-addresses-on.patch
> new file mode 100644
> index 0000000..6f6eef1
> --- /dev/null
> +++ b/meta-arago-extras/recipes-kernel/kexec/kexec-tools-2.0.7/0001-kexec-ks2-use-KS2-aliased-addresses-on.patch
> @@ -0,0 +1,273 @@
> +From b19043c87b481d7faf6ffa72eb6e47920ef51f49 Mon Sep 17 00:00:00 2001
> +From: Vitaly Andrianov <vitalya@ti.com>
> +Date: Tue, 5 Aug 2014 13:40:06 -0400
> +Subject: [KEXEC-TOOLS PATCH] kexec/ks2: use KS2 aliased addresses only
> +
> +KS2 SOC doesn't have physical memory at the first 4GB address range.
> +In order to access the memory at boot time it aliases two GB of the memory
> +to the that range. So, when kexec creates elf header for the crash kernel
> +it has to convert KS2 physical addresses to the corresponding aliased ones.
> +That is what the patch does.
> +
> +It also limits available memory to the first 4GB and replaces ELF64
> +header by ELF32 ones.
> +
> +Signed-off-by: Vitaly Andrianov <vitalya@ti.com>
> +---
> + kdump/kdump.c                     | 39 ++++++++++++++++++++-------------------
> + kexec/arch/arm/crashdump-arm.c    | 13 +++++++++----
> + kexec/arch/arm/kexec-arm.c        | 10 ++++++++--
> + kexec/arch/arm/kexec-zImage-arm.c |  6 +++---
> + kexec/crashdump-elf.c             |  4 +++-
> + kexec/kexec.h                     |  6 ++++++
> + 6 files changed, 49 insertions(+), 29 deletions(-)
> +
> +diff --git a/kdump/kdump.c b/kdump/kdump.c
> +index 821ee7c..2900416 100644
> +--- a/kdump/kdump.c
> ++++ b/kdump/kdump.c
> +@@ -30,8 +30,8 @@ static void *map_addr(int fd, unsigned long size, off_t offset)
> + 	void *result;
> + 	result = mmap(0, size, PROT_READ, MAP_SHARED, fd, offset);
> + 	if (result == MAP_FAILED) {
> +-		fprintf(stderr, "Cannot mmap " DEV_MEM " offset: %llu size: %lu: %s\n",
> +-			(unsigned long long)offset, size, strerror(errno));
> ++		fprintf(stderr, "Cannot mmap " DEV_MEM " offset: %08x size: %lu: %s\n",
> ++			(unsigned long)offset, size, strerror(errno));
> + 		exit(5);
> + 	}
> + 	return result;
> +@@ -61,7 +61,7 @@ static void *xmalloc(size_t size)
> + }
> + 
> + static void *collect_notes(
> +-	int fd, Elf64_Ehdr *ehdr, Elf64_Phdr *phdr, size_t *note_bytes)
> ++	int fd, Elf32_Ehdr *ehdr, Elf32_Phdr *phdr, size_t *note_bytes)
> + {
> + 	int i;
> + 	size_t bytes, result_bytes;
> +@@ -81,7 +81,7 @@ static void *collect_notes(
> + 
> + 	/* Walk through and capture the notes */
> + 	for(i = 0; i < ehdr->e_phnum; i++) {
> +-		Elf64_Nhdr *hdr, *lhdr, *nhdr;
> ++		Elf32_Nhdr *hdr, *lhdr, *nhdr;
> + 		void *pnotes;
> + 		if (phdr[i].p_type != PT_NOTE) {
> + 			continue;
> +@@ -92,8 +92,8 @@ static void *collect_notes(
> + 		unmap_addr(pnotes, phdr[i].p_filesz);
> + 
> + 		/* Walk through the new notes and find the real length */
> +-		hdr = (Elf64_Nhdr *)(notes + result_bytes);
> +-		lhdr = (Elf64_Nhdr *)(notes + result_bytes + phdr[i].p_filesz);
> ++		hdr = (Elf32_Nhdr *)(notes + result_bytes);
> ++		lhdr = (Elf32_Nhdr *)(notes + result_bytes + phdr[i].p_filesz);
> + 		for(; hdr < lhdr; hdr = nhdr) {
> + 			size_t hdr_size;
> + 			/* If there is not a name this is a invalid/reserved note
> +@@ -107,7 +107,7 @@ static void *collect_notes(
> + 				((hdr->n_namesz + 3) & ~3) +
> + 				((hdr->n_descsz + 3) & ~3);
> + 
> +-			nhdr = (Elf64_Nhdr *)(((char *)hdr) + hdr_size); 
> ++			nhdr = (Elf32_Nhdr *)(((char *)hdr) + hdr_size);
> + 			/* if the note does not fit in the segment stop here */
> + 			if (nhdr > lhdr) {
> + 				break;
> +@@ -121,13 +121,13 @@ static void *collect_notes(
> + }
> + 
> + static void *generate_new_headers(
> +-	Elf64_Ehdr *ehdr, Elf64_Phdr *phdr, size_t note_bytes, size_t *header_bytes)
> ++	Elf32_Ehdr *ehdr, Elf32_Phdr *phdr, size_t note_bytes, size_t *header_bytes)
> + {
> + 	unsigned phnum;
> + 	size_t bytes;
> + 	char *headers;
> +-	Elf64_Ehdr *nehdr;
> +-	Elf64_Phdr *nphdr;
> ++	Elf32_Ehdr *nehdr;
> ++	Elf32_Phdr *nphdr;
> + 	unsigned long long offset;
> + 	int i;
> + 	/* Count the number of program headers.
> +@@ -148,8 +148,8 @@ static void *generate_new_headers(
> + 	headers = xmalloc(bytes);
> + 
> + 	/* Setup pointers to the new headers */
> +-	nehdr = (Elf64_Ehdr *)headers;
> +-	nphdr = (Elf64_Phdr *)(headers + sizeof(*nehdr));
> ++	nehdr = (Elf32_Ehdr *)headers;
> ++	nphdr = (Elf32_Phdr *)(headers + sizeof(*nehdr));
> + 	
> + 	/* Copy and adjust the Elf header */
> + 	memcpy(nehdr, ehdr, sizeof(*nehdr));
> +@@ -213,8 +213,8 @@ int main(int argc, char **argv)
> + {
> + 	char *start_addr_str, *end;
> + 	unsigned long long start_addr;
> +-	Elf64_Ehdr *ehdr;
> +-	Elf64_Phdr *phdr;
> ++	Elf32_Ehdr *ehdr;
> ++	Elf32_Phdr *phdr;
> + 	void *notes, *headers;
> + 	size_t note_bytes, header_bytes;
> + 	int fd;
> +@@ -235,6 +235,7 @@ int main(int argc, char **argv)
> + 		exit(1);
> + 	}
> + 	start_addr = strtoull(start_addr_str, &end, 0);
> ++
> + 	if ((start_addr_str == end) || (*end != '\0')) {
> + 		fprintf(stderr, "Bad core dump start addres: %s\n",
> + 			start_addr_str);
> +@@ -256,21 +257,21 @@ int main(int argc, char **argv)
> + 		(ehdr->e_ident[EI_MAG1] != ELFMAG1) ||
> + 		(ehdr->e_ident[EI_MAG2] != ELFMAG2) ||
> + 		(ehdr->e_ident[EI_MAG3] != ELFMAG3) ||
> +-		(ehdr->e_ident[EI_CLASS] != ELFCLASS64) ||
> ++		(ehdr->e_ident[EI_CLASS] != ELFCLASS32) ||
> + 		(ehdr->e_ident[EI_DATA] != ELFDATALOCAL) ||
> + 		(ehdr->e_ident[EI_VERSION] != EV_CURRENT) ||
> + 		(ehdr->e_type != ET_CORE) ||
> + 		(ehdr->e_version != EV_CURRENT) ||
> +-		(ehdr->e_ehsize != sizeof(Elf64_Ehdr)) ||
> +-		(ehdr->e_phentsize != sizeof(Elf64_Phdr)) ||
> ++		(ehdr->e_ehsize != sizeof(Elf32_Ehdr)) ||
> ++		(ehdr->e_phentsize != sizeof(Elf32_Phdr)) ||
> + 		(ehdr->e_phnum == 0))
> + 	{
> + 		fprintf(stderr, "Invalid Elf header\n");
> + 		exit(4);
> + 	}
> +-	
> + 	/* Get the program header */
> +-	phdr = map_addr(fd, sizeof(*phdr)*(ehdr->e_phnum), ehdr->e_phoff);
> ++	phdr = map_addr(fd, sizeof(*phdr)*(ehdr->e_phnum),
> ++			ehdr->e_phoff + start_addr);
> + 
> + 	/* Collect up the notes */
> + 	note_bytes = 0;
> +diff --git a/kexec/arch/arm/crashdump-arm.c b/kexec/arch/arm/crashdump-arm.c
> +index b523e5f..23f5999 100644
> +--- a/kexec/arch/arm/crashdump-arm.c
> ++++ b/kexec/arch/arm/crashdump-arm.c
> +@@ -143,16 +143,21 @@ static int crash_range_callback(void *UNUSED(data), int UNUSED(nr),
> + 	if (usablemem_rgns.size >= CRASH_MAX_MEMORY_RANGES)
> + 		return 1;
> + 
> ++
> + 	range = usablemem_rgns.ranges + usablemem_rgns.size;
> + 
> ++	/* Keystone2 cannot use more than 2GB of DDR */ 
> ++	if ((base + length) >= K2_MEM_2G_END)
> ++		return 0;
> ++
> + 	if (strncmp(str, "System RAM\n", 11) == 0) {
> +-		range->start = base;
> +-		range->end = base + length - 1;
> ++		range->start = base - K2_ALIAS_OFFSET;
> ++		range->end = base + length - 1 - K2_ALIAS_OFFSET;
> + 		range->type = RANGE_RAM;
> + 		usablemem_rgns.size++;
> + 	} else if (strncmp(str, "Crash kernel\n", 13) == 0) {
> +-		crash_reserved_mem.start = base;
> +-		crash_reserved_mem.end = base + length - 1;
> ++		crash_reserved_mem.start = base - K2_ALIAS_OFFSET;
> ++		crash_reserved_mem.end = base + length - 1 - K2_ALIAS_OFFSET;
> + 		crash_reserved_mem.type = RANGE_RAM;
> + 	}
> + 
> +diff --git a/kexec/arch/arm/kexec-arm.c b/kexec/arch/arm/kexec-arm.c
> +index 6e8e320..d6b204d 100644
> +--- a/kexec/arch/arm/kexec-arm.c
> ++++ b/kexec/arch/arm/kexec-arm.c
> +@@ -61,8 +61,14 @@ int get_memory_ranges(struct memory_range **range, int *ranges,
> + 			continue;
> + 		}
> + 
> +-		memory_range[memory_ranges].start = start;
> +-		memory_range[memory_ranges].end = end;
> ++		if (start < K2_MEM_START || start >= K2_MEM_2G_END)
> ++			continue;
> ++
> ++		if (end > K2_MEM_2G_END)
> ++			end == K2_MEM_2G_END;
> ++
> ++		memory_range[memory_ranges].start = start - K2_ALIAS_OFFSET;
> ++		memory_range[memory_ranges].end = end - K2_ALIAS_OFFSET;
> + 		memory_range[memory_ranges].type = type;
> + 		memory_ranges++;
> + 	}
> +diff --git a/kexec/arch/arm/kexec-zImage-arm.c b/kexec/arch/arm/kexec-zImage-arm.c
> +index 44b87bb..a4aa000 100644
> +--- a/kexec/arch/arm/kexec-zImage-arm.c
> ++++ b/kexec/arch/arm/kexec-zImage-arm.c
> +@@ -93,7 +93,7 @@ int zImage_arm_probe(const char *UNUSED(buf), off_t UNUSED(len))
> + 	/* 
> + 	 * Only zImage loading is supported. Do not check if
> + 	 * the buffer is valid kernel image
> +-	 */	
> ++	 */
> + 	return 0;
> + }
> + 
> +@@ -150,7 +150,7 @@ int atag_arm_load(struct kexec_info *info, unsigned long base,
> + 	off_t len;
> + 	struct tag *params;
> + 	uint32_t *initrd_start = NULL;
> +-	
> ++
> + 	buf = xmalloc(getpagesize());
> + 	if (!buf) {
> + 		fprintf(stderr, "Compiling ATAGs: out of memory\n");
> +@@ -407,7 +407,7 @@ int zImage_arm_load(int argc, char **argv, const char *buf, off_t len,
> + 			 */
> + 			return -1;
> + 		}
> +-		base = start;
> ++		base = start - K2_ALIAS_OFFSET;
> + 	} else {
> + 		base = locate_hole(info, len + extra_size, 0, 0,
> + 				   ULONG_MAX, INT_MAX);
> +diff --git a/kexec/crashdump-elf.c b/kexec/crashdump-elf.c
> +index c869347..0585cba 100644
> +--- a/kexec/crashdump-elf.c
> ++++ b/kexec/crashdump-elf.c
> +@@ -151,7 +151,7 @@ int FUNC(struct kexec_info *info,
> + 		bufp += sizeof(PHDR);
> + 		phdr->p_type	= PT_NOTE;
> + 		phdr->p_flags	= 0;
> +-		phdr->p_offset  = phdr->p_paddr = notes_addr;
> ++		phdr->p_offset  = phdr->p_paddr = notes_addr - K2_ALIAS_OFFSET;
> + 		phdr->p_vaddr   = 0;
> + 		phdr->p_filesz	= phdr->p_memsz	= notes_len;
> + 		/* Do we need any alignment of segments? */
> +@@ -202,6 +202,8 @@ int FUNC(struct kexec_info *info,
> + 			continue;
> + 		mstart = range->start;
> + 		mend = range->end;
> ++		if (mend >= 0x100000000ULL)
> ++			continue;
> + 		if (!mstart && !mend)
> + 			continue;
> + 		phdr = (PHDR *) bufp;
> +diff --git a/kexec/kexec.h b/kexec/kexec.h
> +index 2fad7dc..de6f4da 100644
> +--- a/kexec/kexec.h
> ++++ b/kexec/kexec.h
> +@@ -297,4 +297,10 @@ int xen_kexec_load(struct kexec_info *info);
> + int xen_kexec_unload(uint64_t kexec_flags);
> + void xen_kexec_exec(void);
> + 
> ++/* Keystone2 definitions */
> ++
> ++#define K2_MEM_START  0x800000000ULL
> ++#define K2_MEM_2G_END 0x880000000ULL
> ++#define K2_ALIAS_OFFSET 0x780000000ULL
> ++
> + #endif /* KEXEC_H */
> +-- 
> +1.9.1
> +
> diff --git a/meta-arago-extras/recipes-kernel/kexec/kexec-tools_2.0.7.bb b/meta-arago-extras/recipes-kernel/kexec/kexec-tools_2.0.7.bb
> new file mode 100644
> index 0000000..273742c
> --- /dev/null
> +++ b/meta-arago-extras/recipes-kernel/kexec/kexec-tools_2.0.7.bb
> @@ -0,0 +1,18 @@
> +require recipes-kernel/kexec/kexec-tools.inc
> +export LDFLAGS = "-L${STAGING_LIBDIR}"
> +EXTRA_OECONF = " --with-zlib=yes"
> +
> +PR = "r0"
> +
> +S = "${WORKDIR}/git"
> +
> +BRANCH="master"
> +SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git;protocol=git;branch=${BRANCH}"
> +SRC_URI_keystone +=  "file://0001-kexec-ks2-use-KS2-aliased-addresses-on.patch "
> +
> +SRCREV = "4afd47956f05ec8f71daf688d5d52837d6e40b2c"
> +
> +PACKAGES =+ "kexec kdump"
> +
> +FILES_kexec = "${sbindir}/kexec"
> +FILES_kdump = "${sbindir}/kdump"
> -- 
> 1.7.9.5

Ok, this is better. You'd also want to set PACKAGE_ARCH=MACHINE_ARCH due to 
machine-specific build...

-- 
Denys

