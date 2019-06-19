Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id BDE0752998
	for <meta-arago@arago-project.org>;
	Wed, 19 Jun 2019 19:27:27 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5JJQkcH085665
	for <meta-arago@arago-project.org>; Wed, 19 Jun 2019 14:26:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560972406;
	bh=GBk8aJlHIMGyCrFS1cgRnybecdq5uDn0VVaoELcwYsQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=gRxjgsfOpYSc/juTxEF95/0gfRXsSRQSnUPfIWZBZt6RHBvHry4OMLeWDUqOl0Ftq
	1LVtuHPwr0ncz9h082W9tj8tWtKxDhpTl668m9qriTDDfBzxpXxgwQ2txycgXohA26
	kMxT0QAU/B3DA7L6wxwWQuKYo4KRuztrPiaFZX/4=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5JJQkmA068350
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 19 Jun 2019 14:26:46 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 19 Jun 2019 14:26:45 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 19 Jun 2019 14:26:45 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5JJQjK8069831;
	Wed, 19 Jun 2019 14:26:45 -0500
Date: Wed, 19 Jun 2019 15:26:45 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Anand Balagopalakrishnan <anandb@ti.com>
Message-ID: <20190619192645.GN32001@beryl>
References: <1560946434-45648-1-git-send-email-anandb@ti.com>
MIME-Version: 1.0
In-Reply-To: <1560946434-45648-1-git-send-email-anandb@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [[thud] PATCH] libdrm: add support for sync info
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
X-List-Received-Date: Wed, 19 Jun 2019 19:27:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

What are the upstream plans for these patches?


On Wed, Jun 19, 2019 at 05:43:54PM +0530, Anand Balagopalakrishnan wrote:
> Add support functions to provide sync and fence info. These patches are
> needed for Rogue GPU driver which leverages dmabuf fence for synchronization.
> 
> Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
> ---
>  ...-libsync-add-support-for-pre-v4.7-kernels.patch |  92 +++++++++
>  ...0002-Add-sync_fence_info-and-sync_pt_info.patch | 212 +++++++++++++++++++++
>  .../recipes-graphics/drm/libdrm_%.bbappend         |   4 +-
>  3 files changed, 307 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arago-distro/recipes-graphics/drm/libdrm/0001-libsync-add-support-for-pre-v4.7-kernels.patch
>  create mode 100644 meta-arago-distro/recipes-graphics/drm/libdrm/0002-Add-sync_fence_info-and-sync_pt_info.patch
> 
> diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-libsync-add-support-for-pre-v4.7-kernels.patch b/meta-arago-distro/recipes-graphics/drm/libdrm/0001-libsync-add-support-for-pre-v4.7-kernels.patch
> new file mode 100644
> index 0000000..c9fdfed
> --- /dev/null
> +++ b/meta-arago-distro/recipes-graphics/drm/libdrm/0001-libsync-add-support-for-pre-v4.7-kernels.patch
> @@ -0,0 +1,92 @@
> +From 900afd25d9a35b2b8fd29f8c424aa3c3cd170d6f Mon Sep 17 00:00:00 2001
> +From: Brendan King <Brendan.King@imgtec.com>
> +Date: Tue, 13 Jun 2017 15:52:44 +0100
> +Subject: [PATCH 1/2] libsync: add support for pre-v4.7 kernels
> +
> +Add support for the the sync merge ioctl supported by older kernels.
> +---
> + libsync.h | 44 +++++++++++++++++++++++++++++++++++++++++---
> + 1 file changed, 41 insertions(+), 3 deletions(-)
> +
> +diff --git a/libsync.h b/libsync.h
> +index f1a2f96d..c3b8a385 100644
> +--- a/libsync.h
> ++++ b/libsync.h
> +@@ -40,6 +40,10 @@
> + extern "C" {
> + #endif
> + 
> ++#ifndef SYNC_IOC_MAGIC
> ++#define SYNC_IOC_MAGIC		'>'
> ++#endif
> ++
> + #ifndef SYNC_IOC_MERGE
> + /* duplicated from linux/sync_file.h to avoid build-time dependency
> +  * on new (v4.7) kernel headers.  Once distro's are mostly using
> +@@ -53,10 +57,22 @@ struct sync_merge_data {
> + 	uint32_t	flags;
> + 	uint32_t	pad;
> + };
> +-#define SYNC_IOC_MAGIC		'>'
> + #define SYNC_IOC_MERGE		_IOWR(SYNC_IOC_MAGIC, 3, struct sync_merge_data)
> + #endif
> + 
> ++#ifndef SYNC_IOC_LEGACY_MERGE
> ++/* the legacy definitions are based on the contents of
> ++ * drivers/staging/android/uapi/sync.h in the v4.4 kernel.
> ++ */
> ++struct sync_legacy_merge_data {
> ++	int32_t	fd2;
> ++	char	name[32];
> ++	int32_t	fence;
> ++};
> ++
> ++#define SYNC_IOC_LEGACY_MERGE	_IOWR(SYNC_IOC_MAGIC, 1, \
> ++	struct sync_legacy_merge_data)
> ++#endif
> + 
> + static inline int sync_wait(int fd, int timeout)
> + {
> +@@ -83,6 +99,24 @@ static inline int sync_wait(int fd, int timeout)
> + 	return ret;
> + }
> + 
> ++static inline int sync_legacy_merge(const char *name, int fd1, int fd2)
> ++{
> ++	struct sync_legacy_merge_data data;
> ++	int ret;
> ++
> ++	data.fd2 = fd2;
> ++	strncpy(data.name, name, sizeof(data.name));
> ++
> ++	do {
> ++		ret = ioctl(fd1, SYNC_IOC_LEGACY_MERGE, &data);
> ++	} while (ret == -1 && (errno == EINTR || errno == EAGAIN));
> ++
> ++	if (ret < 0)
> ++		return ret;
> ++
> ++	return data.fence;
> ++}
> ++
> + static inline int sync_merge(const char *name, int fd1, int fd2)
> + {
> + 	struct sync_merge_data data = {0};
> +@@ -95,8 +129,12 @@ static inline int sync_merge(const char *name, int fd1, int fd2)
> + 		ret = ioctl(fd1, SYNC_IOC_MERGE, &data);
> + 	} while (ret == -1 && (errno == EINTR || errno == EAGAIN));
> + 
> +-	if (ret < 0)
> +-		return ret;
> ++	if (ret < 0) {
> ++		if (errno == ENOTTY)
> ++			return sync_legacy_merge(name, fd1, fd2);
> ++		else
> ++			return ret;
> ++	}
> + 
> + 	return data.fence;
> + }
> +-- 
> +2.17.1
> +
> diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm/0002-Add-sync_fence_info-and-sync_pt_info.patch b/meta-arago-distro/recipes-graphics/drm/libdrm/0002-Add-sync_fence_info-and-sync_pt_info.patch
> new file mode 100644
> index 0000000..428def6
> --- /dev/null
> +++ b/meta-arago-distro/recipes-graphics/drm/libdrm/0002-Add-sync_fence_info-and-sync_pt_info.patch
> @@ -0,0 +1,212 @@
> +From 09da458d04e048a80500feb7d167a4faac56f84e Mon Sep 17 00:00:00 2001
> +From: Brendan King <Brendan.King@imgtec.com>
> +Date: Thu, 24 Aug 2017 13:28:38 +0100
> +Subject: [PATCH 2/2] Add sync_fence_info and sync_pt_info
> +
> +For pre-4.7 kernels, sync_fence_info returns the data from the
> +SYNC_IOC_FENCE_INFO ioctl. For newer kernels, the SYNC_IOC_FILE_INFO
> +ioctl is called, and the data converted to SYNC_IOC_FENCE_INFO form.
> +---
> + libsync.h | 172 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
> + 1 file changed, 172 insertions(+)
> +
> +diff --git a/libsync.h b/libsync.h
> +index c3b8a385..44f7330d 100644
> +--- a/libsync.h
> ++++ b/libsync.h
> +@@ -31,6 +31,7 @@
> + #include <assert.h>
> + #include <errno.h>
> + #include <stdint.h>
> ++#include <stdlib.h>
> + #include <string.h>
> + #include <sys/ioctl.h>
> + #include <sys/poll.h>
> +@@ -74,6 +75,54 @@ struct sync_legacy_merge_data {
> + 	struct sync_legacy_merge_data)
> + #endif
> + 
> ++#ifndef SYNC_IOC_FILE_INFO
> ++/* duplicated from linux/sync_file.h to avoid a build-time dependency
> ++ * on new (v4.7) kernel headers.
> ++ */
> ++struct sync_fence_info {
> ++	char		obj_name[32];
> ++	char		driver_name[32];
> ++	int32_t		status;
> ++	uint32_t	flags;
> ++	uint64_t	timestamp_ns;
> ++};
> ++
> ++struct sync_file_info {
> ++	char		name[32];
> ++	int32_t		status;
> ++	uint32_t	flags;
> ++	uint32_t	num_fences;
> ++	uint32_t	pad;
> ++	uint64_t	sync_fence_info;
> ++};
> ++
> ++#define SYNC_IOC_FILE_INFO	_IOWR(SYNC_IOC_MAGIC, 4, struct sync_file_info)
> ++#endif
> ++
> ++#ifndef SYNC_IOC_LEGACY_FENCE_INFO
> ++/* the legacy definitions are based on the contents of
> ++ * drivers/staging/android/uapi/sync.h in the v4.4 kernel.
> ++ */
> ++struct sync_pt_info {
> ++	uint32_t	len;
> ++	char		obj_name[32];
> ++	char		driver_name[32];
> ++	int32_t		status;
> ++	uint64_t	timestamp_ns;
> ++	uint8_t		driver_data[0];
> ++};
> ++
> ++struct sync_fence_info_data {
> ++	uint32_t	len;
> ++	char		name[32];
> ++	int32_t		status;
> ++	uint8_t		pt_info[0];
> ++};
> ++
> ++#define SYNC_IOC_LEGACY_FENCE_INFO	_IOWR(SYNC_IOC_MAGIC, 2, \
> ++	struct sync_fence_info_data)
> ++#endif
> ++
> + static inline int sync_wait(int fd, int timeout)
> + {
> + 	struct pollfd fds = {0};
> +@@ -179,6 +228,129 @@ static inline int sync_accumulate(const char *name, int *fd1, int fd2)
> + 	return 0;
> + }
> + 
> ++static inline struct sync_pt_info *sync_pt_info(
> ++					struct sync_fence_info_data *info,
> ++					struct sync_pt_info *pt_info)
> ++{
> ++	if (!pt_info)
> ++		pt_info = (struct sync_pt_info *)info->pt_info;
> ++	else
> ++		pt_info = (struct sync_pt_info *)((uint8_t *)pt_info +
> ++				pt_info->len);
> ++
> ++	if ((uint32_t)((uint8_t *)pt_info - (uint8_t *)info) >= info->len)
> ++		return NULL;
> ++
> ++	return pt_info;
> ++}
> ++
> ++static inline struct sync_fence_info_data *sync_legacy_fence_info(int fd)
> ++{
> ++	const uint32_t len = 4096;
> ++	struct sync_fence_info_data *info = malloc(len);
> ++	int ret;
> ++
> ++	if (!info)
> ++		return NULL;
> ++
> ++	info->len = len;
> ++
> ++	do {
> ++		ret = ioctl(fd, SYNC_IOC_LEGACY_FENCE_INFO, info);
> ++	} while (ret == -1 && (errno == EINTR || errno == EAGAIN));
> ++
> ++	if (ret < 0) {
> ++		free(info);
> ++		return NULL;
> ++	}
> ++
> ++	return info;
> ++}
> ++
> ++static inline struct sync_fence_info_data *fence_info_from_file_info(
> ++					struct sync_file_info *file_info,
> ++					uint32_t num_fences)
> ++{
> ++	struct sync_fence_info_data *info;
> ++	size_t info_len;
> ++	struct sync_pt_info *pt_info = NULL;
> ++	struct sync_fence_info *fence_info;
> ++	uint32_t i;
> ++
> ++	info_len = sizeof(*info) + num_fences * sizeof(*pt_info);
> ++	info = malloc(info_len);
> ++	if (!info)
> ++		return NULL;
> ++
> ++	info->len = info_len;
> ++	strncpy(info->name, file_info->name, sizeof(info->name));
> ++	info->status = file_info->status;
> ++
> ++	fence_info = (struct sync_fence_info *)(uintptr_t)
> ++			file_info->sync_fence_info;
> ++	for (i = 0; i < num_fences; i++) {
> ++		pt_info = sync_pt_info(info, pt_info);
> ++		assert(pt_info);
> ++
> ++		pt_info->len = sizeof(*pt_info);
> ++		strncpy(pt_info->obj_name, fence_info->obj_name,
> ++			sizeof(pt_info->obj_name));
> ++		strncpy(pt_info->driver_name, fence_info->driver_name,
> ++			sizeof(pt_info->driver_name));
> ++		pt_info->status = fence_info->status;
> ++		pt_info->timestamp_ns = fence_info->timestamp_ns;
> ++
> ++		fence_info++;
> ++	}
> ++
> ++	return info;
> ++}
> ++
> ++static inline struct sync_fence_info_data *sync_fence_info(int fd)
> ++{
> ++	struct sync_fence_info_data *info = NULL;
> ++	struct sync_file_info initial_info = {""};
> ++	struct sync_file_info *file_info;
> ++	int ret;
> ++
> ++	do {
> ++		ret = ioctl(fd, SYNC_IOC_FILE_INFO, &initial_info);
> ++	} while (ret == -1 && (errno == EINTR || errno == EAGAIN));
> ++
> ++	if (ret < 0) {
> ++		if (errno == ENOTTY)
> ++			return sync_legacy_fence_info(fd);
> ++		else
> ++			return NULL;
> ++	}
> ++
> ++	file_info = calloc(1, sizeof(*file_info) + initial_info.num_fences *
> ++				sizeof(struct sync_fence_info));
> ++	if (!file_info)
> ++		return NULL;
> ++
> ++	file_info->num_fences = initial_info.num_fences;
> ++	file_info->sync_fence_info = (uint64_t)(uintptr_t)(file_info + 1);
> ++
> ++	do {
> ++		ret = ioctl(fd, SYNC_IOC_FILE_INFO, file_info);
> ++	} while (ret == -1 && (errno == EINTR || errno == EAGAIN));
> ++
> ++	if (ret < 0)
> ++		goto free_file_info;
> ++
> ++	info = fence_info_from_file_info(file_info, initial_info.num_fences);
> ++
> ++free_file_info:
> ++	free(file_info);
> ++
> ++	return info;
> ++}
> ++
> ++static inline void sync_fence_info_free(struct sync_fence_info_data *info)
> ++{
> ++	free(info);
> ++}
> + #if defined(__cplusplus)
> + }
> + #endif
> +-- 
> +2.17.1
> +
> diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend b/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
> index 9945149..99d2fa7 100644
> --- a/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
> +++ b/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
> @@ -4,9 +4,11 @@ SRC_URI += " \
>  file://0001-Add-option-to-run-a-test-indefinitely.patch \
>  file://0001-omap-fix-omap_bo_size-for-tiled-buffers.patch \
>  file://0002-omap-add-OMAP_BO-flags-to-affect-buffer-allocation.patch \
> +file://0001-libsync-add-support-for-pre-v4.7-kernels.patch \
> +file://0002-Add-sync_fence_info-and-sync_pt_info.patch \
>  "
>  
> -PR_append = ".arago2"
> +PR_append = ".arago3"
>  
>  inherit update-alternatives
>  
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

