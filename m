Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 3F4A2529B7
	for <meta-arago@arago-project.org>;
	Tue, 29 Oct 2019 21:14:22 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9TLD2gE129030
	for <meta-arago@arago-project.org>; Tue, 29 Oct 2019 16:13:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572383582;
	bh=3nKW1cfrCY79VRTtJR1oMRGJbd84j8Q3LvxhXpLaTeQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=iav1l80peXyTk7CMwehqo/15i/fw9jwGZeJ8i6CWw1L298FeYW65O18u7aQV/AWE9
	VeRVdo45fZlFZJBN3QFQnGIDVnR44pQuSs7g5hlHnBXnZv8/3W7OJzJVl5KaesHu0g
	NDi3VhLy0lAkhXWDv4AmZBKW1wZNFD/XRQ8U4Ag0=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9TLD2mU095061
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 29 Oct 2019 16:13:02 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 29 Oct 2019 16:12:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 29 Oct 2019 16:12:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9TLD1ei047054;
	Tue, 29 Oct 2019 16:13:01 -0500
Date: Tue, 29 Oct 2019 17:13:01 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20191029211300.GI7518@beryl>
References: <20191029135349.31792-1-e-ruei1@ti.com>
	<20191029135349.31792-5-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <20191029135349.31792-5-e-ruei1@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 4/7] HACK: qtwebkit: define MESA_EGL_NO_X11_HEADERS at ANGLE/khrplatform.h
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
X-List-Received-Date: Tue, 29 Oct 2019 21:14:22 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 29, 2019 at 09:53:46AM -0400, Eric Ruei wrote:
> This is a tentative workaround due to unclean qtwebkit build procedure
> where khrplatform.h under both sysroot/usr/include and 3rdparty/ANGLE
> is used.
> 
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  ...atform.h-add-define-MESA_EGL_NO_X11_.patch | 28 +++++++++++++++++++
>  .../recipes-qt/qt5/qtwebkit_%.bbappend        |  3 +-
>  2 files changed, 30 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch
> 
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch
> new file mode 100644
> index 00000000..c6022ef6
> --- /dev/null
> +++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch
> @@ -0,0 +1,28 @@
> +From c969fa7eedb3bce04c8f48caf469a46361437aa7 Mon Sep 17 00:00:00 2001
> +From: Eric Ruei <e-ruei1@ti.com>
> +Date: Fri, 30 Aug 2019 17:41:13 -0400
> +Subject: [PATCH] HACK: ANGLE/khrplatform.h: add #define
> + MESA_EGL_NO_X11_HEADERS
> +
> +Note: Only the KHR/khrplatform.h at sysroot/usr/include should be used.
> +      This patch is a tentative workaround to make both files compatible

Upstream-Status: Inappropriate [reason]


> +Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> +---
> + Source/ThirdParty/ANGLE/include/KHR/khrplatform.h | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/Source/ThirdParty/ANGLE/include/KHR/khrplatform.h b/Source/ThirdParty/ANGLE/include/KHR/khrplatform.h
> +index c9e6f17d3..4e3ff69a8 100644
> +--- a/Source/ThirdParty/ANGLE/include/KHR/khrplatform.h
> ++++ b/Source/ThirdParty/ANGLE/include/KHR/khrplatform.h
> +@@ -279,4 +279,6 @@ typedef enum {
> +     KHRONOS_BOOLEAN_ENUM_FORCE_SIZE = KHRONOS_MAX_ENUM
> + } khronos_boolean_enum_t;
> + 
> ++#define MESA_EGL_NO_X11_HEADERS
> ++
> + #endif /* __khrplatform_h_ */
> +-- 
> +2.17.1
> +
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
> index 75213487..1dbe40d1 100644
> --- a/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
> +++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
> @@ -6,9 +6,10 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
>  SRC_URI += " \
>  	file://GraphicsSurfaceGL_NoX.cpp.patch \
> +	file://0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch \
>  "
>  
> -PR_append = ".arago7"
> +PR_append = ".arago8"
>  
>  EXTRA_OECMAKE_append = " -DCMAKE_BUILD_TYPE=Release"
>  
> -- 
> 2.17.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

