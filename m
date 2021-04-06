Return-Path: <praneeth@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 3110652BE0
	for <meta-arago@arago-project.org>;
	Tue,  6 Apr 2021 04:17:26 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1364Hl9j060624;
	Mon, 5 Apr 2021 23:17:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617682667;
	bh=BE5c1cVmwt5VemSDpIYy87Q8qss2dMJRNkJMUOScPY4=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=m/gGjtuenYHdO+3bTkf+4QSxTgXPh4ch8t5sq0XeFnDhAAKCGhbjwTs69pzkFcosB
	b2ZyI+VGfDNGOhm3CLPbY2xL6Ah8AgjBMO0o9nuIhXd2VVzc9ZGErXZ79YwLC7wLyO
	kA3MrqhcehGJ+m8oXvKaJhRR2mpYh5QISWGNP1Fo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1364Hl7D062391
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Apr 2021 23:17:47 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Mon, 5 Apr 2021 23:17:47 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Mon, 5 Apr 2021 23:17:47 -0500
Received: from [10.250.50.222] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1364HlFY105222;
	Mon, 5 Apr 2021 23:17:47 -0500
To: Gowtham Tammana <g-tammana@ti.com>, <meta-arago@arago-project.org>,
	<denys@konsulko.com>
References: <20210401163340.12248-1-g-tammana@ti.com>
	<20210401163340.12248-2-g-tammana@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
Message-ID: <9e35e9c1-748a-e96e-642f-ec2344fc87a4@ti.com>
Date: Mon, 5 Apr 2021 23:17:47 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210401163340.12248-2-g-tammana@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Krunal Bhargav <k-bhargav@ti.com>
Subject: Re: [dunfell][PATCH 1/3] Revert "HACK: qtwebkit: define MESA_EGL_NO_X11_HEADERS at ANGLE/khrplatform.h"
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
X-List-Received-Date: Tue, 06 Apr 2021 04:17:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 4/1/2021 11:33 AM, Gowtham Tammana wrote:
> This reverts commit 1e83ebf61bd22ca8ad04d5538db044d81330df2c. It is no
> longer needed as it is handled through build dependencies.

no signed-off-by ?

Will append before merging to dunfell

> ---
>   ...atform.h-add-define-MESA_EGL_NO_X11_.patch | 30 -------------------
>   .../recipes-qt/qt5/qtwebkit_%.bbappend        |  3 +-
>   2 files changed, 1 insertion(+), 32 deletions(-)
>   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch
> 
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch
> deleted file mode 100644
> index 29521a8e..00000000
> --- a/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 4a21fcedd886772b7e1bd40861835f1b4f33c7ff Mon Sep 17 00:00:00 2001
> -From: Eric Ruei <e-ruei1@ti.com>
> -Date: Fri, 30 Aug 2019 17:41:13 -0400
> -Subject: [PATCH] HACK: ANGLE/khrplatform.h: add #define
> - MESA_EGL_NO_X11_HEADERS
> -
> -Note: Only the KHR/khrplatform.h at sysroot/usr/include should be used.
> -      This patch is a tentative workaround to make both files compatible
> -
> -Upstream-Status: Inappropriate [tentative workaround only]
> -
> -Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ----
> - Source/ThirdParty/ANGLE/include/KHR/khrplatform.h | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/Source/ThirdParty/ANGLE/include/KHR/khrplatform.h b/Source/ThirdParty/ANGLE/include/KHR/khrplatform.h
> -index c9e6f17d3..4e3ff69a8 100644
> ---- a/Source/ThirdParty/ANGLE/include/KHR/khrplatform.h
> -+++ b/Source/ThirdParty/ANGLE/include/KHR/khrplatform.h
> -@@ -279,4 +279,6 @@ typedef enum {
> -     KHRONOS_BOOLEAN_ENUM_FORCE_SIZE = KHRONOS_MAX_ENUM
> - } khronos_boolean_enum_t;
> -
> -+#define MESA_EGL_NO_X11_HEADERS
> -+
> - #endif /* __khrplatform_h_ */
> ---
> -2.17.1
> -
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
> index 1dbe40d1..75213487 100644
> --- a/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
> +++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
> @@ -6,10 +6,9 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>   
>   SRC_URI += " \
>   	file://GraphicsSurfaceGL_NoX.cpp.patch \
> -	file://0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch \
>   "
>   
> -PR_append = ".arago8"
> +PR_append = ".arago7"
>   
>   EXTRA_OECMAKE_append = " -DCMAKE_BUILD_TYPE=Release"
>   
> 

