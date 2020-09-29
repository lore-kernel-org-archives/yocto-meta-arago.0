Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 7696552991
	for <meta-arago@arago-project.org>;
	Tue, 29 Sep 2020 15:20:33 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08TFHYuS065390
	for <meta-arago@arago-project.org>; Tue, 29 Sep 2020 10:17:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1601392654;
	bh=c5zr8bLDYcqNtDcbBCiufRQ13QC6NZZ2LObmd4HuAdQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=jC43anrSGaqJOkSVgbSj6PW1EFcCKunuFzHqhxXKc7DqRX+ZetTGdBhkll9lWQivB
	ih8sxT4rSuiJzJwFyWvROISOH5RwUBGB/LLpB+sC/ccZW4U5LTA+XNZBPjC4I+Wc63
	p52MzVB17vyEjR3YmoyxEDHDzsKrqbH9MFLkNwWk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08TFHYDh127267
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 29 Sep 2020 10:17:34 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 29 Sep 2020 10:17:34 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Tue, 29 Sep 2020 10:17:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08TFHXC9033428;
	Tue, 29 Sep 2020 10:17:33 -0500
Date: Tue, 29 Sep 2020 11:17:33 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Gowtham Tammana <g-tammana@ti.com>
Message-ID: <20200929151733.GA7434@beryl>
References: <20200929130930.13211-1-g-tammana@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200929130930.13211-1-g-tammana@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [master/dunfell][PATCH] kmscube: enable gles3 targets conditionally
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
X-List-Received-Date: Tue, 29 Sep 2020 15:20:33 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Sep 29, 2020 at 08:09:30AM -0500, Gowtham Tammana wrote:
> Patch kmscube to enable gles3 targets conditionally, as not all glesv2
> targets support glesv3.

Looks good, except this one at the end:
+PR_APPEND = ".arago1"


> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> ---
>  .../0001-meson-check-for-gles3-support.patch  | 50 +++++++++++++++++++
>  .../kmscube/kmscube_%.bbappend                |  7 +++
>  2 files changed, 57 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-graphics/kmscube/kmscube/0001-meson-check-for-gles3-support.patch
>  create mode 100644 meta-arago-distro/recipes-graphics/kmscube/kmscube_%.bbappend
> 
> diff --git a/meta-arago-distro/recipes-graphics/kmscube/kmscube/0001-meson-check-for-gles3-support.patch b/meta-arago-distro/recipes-graphics/kmscube/kmscube/0001-meson-check-for-gles3-support.patch
> new file mode 100644
> index 00000000..67d7aca7
> --- /dev/null
> +++ b/meta-arago-distro/recipes-graphics/kmscube/kmscube/0001-meson-check-for-gles3-support.patch
> @@ -0,0 +1,50 @@
> +From 9f7efd751a3cdceaeefa6c215a81aa6368857e40 Mon Sep 17 00:00:00 2001
> +From: Gowtham Tammana <g-tammana@ti.com>
> +Date: Mon, 28 Sep 2020 21:15:52 -0500
> +Subject: [PATCH] meson: check for gles3 support
> +
> +Some cores don't support gles3, so compile gles3 targets
> +conditionally.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> +---
> + meson.build | 22 +++++++++++++++-------
> + 1 file changed, 15 insertions(+), 7 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index df9c315..8bba902 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -91,12 +91,20 @@ else
> +   message('Building without gstreamer support')
> + endif
> + 
> +-executable('kmscube', sources, dependencies : dep_common, install : true)
> ++# GLES3 check
> ++gles3_h = false
> ++if dep_gles2.found()
> ++  gles3_h = cc.has_header('GLES3/gl3.h', dependencies: dep_gles2)
> ++  message('Building with GLES3 support')
> ++endif
> + 
> ++executable('kmscube', sources, dependencies : dep_common, install : true)
> + 
> +-executable('texturator', files(
> +-	'common.c',
> +-	'drm-legacy.c',
> +-	'drm-common.c',
> +-	'texturator.c',
> +-), dependencies : dep_common, install : true)
> ++if gles3_h
> ++  executable('texturator', files(
> ++    'common.c',
> ++    'drm-legacy.c',
> ++    'drm-common.c',
> ++    'texturator.c',
> ++  ), dependencies : dep_common, install : true)
> ++endif
> +-- 
> +2.17.1
> +
> diff --git a/meta-arago-distro/recipes-graphics/kmscube/kmscube_%.bbappend b/meta-arago-distro/recipes-graphics/kmscube/kmscube_%.bbappend
> new file mode 100644
> index 00000000..7b27c894
> --- /dev/null
> +++ b/meta-arago-distro/recipes-graphics/kmscube/kmscube_%.bbappend
> @@ -0,0 +1,7 @@
> +FILESEXTRAPATHS_append := "${THISDIR}/${PN}:"
> +
> +SRC_URI += " \
> +file://0001-meson-check-for-gles3-support.patch \
> +"
> +
> +PR_APPEND = ".arago1"
> -- 
> 2.17.1
> 

