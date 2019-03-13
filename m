Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 4B637520E5
	for <meta-arago@arago-project.org>;
	Wed, 13 Mar 2019 00:28:01 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2D0RpgT083862
	for <meta-arago@arago-project.org>; Tue, 12 Mar 2019 19:27:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552436871;
	bh=gw9rYf8Ll97P00mAglbnv98BPu3DmE7e02cI8bZ5OSw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Q5C9znwF/saMV+5ddJb2+qoYhH4jKtPKLdbBA8z6vUErZ6zxpsBxo64JInjR7ct2L
	Zt4Jx5KqUU5xRKtQC48RNxeNos2NsmKoH0LyuLpXtH39msvG+kFA9ZJn2R9Z4y+kUo
	agCiovUcYGX8RtEgLyR3ltfdS1Cn4x9RH0D7r0gA=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2D0Rpe7049356
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 12 Mar 2019 19:27:51 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 12 Mar 2019 19:27:51 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 12 Mar 2019 19:27:51 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2D0RpCj025400;
	Tue, 12 Mar 2019 19:27:51 -0500
Date: Tue, 12 Mar 2019 20:27:50 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20190313002750.GK28041@beryl>
References: <1552344407-4932-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <1552344407-4932-1-git-send-email-e-ruei1@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [rocko/master][PATCH] packagegroup-arago-tisdk-target: include gtk sdk only if sgx is included
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
X-List-Received-Date: Wed, 13 Mar 2019 00:28:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Now I need to verify - is it meant for rocko or thud?

On Mon, Mar 11, 2019 at 06:46:47PM -0400, Eric Ruei wrote:
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-toolchain-tisdk-target.bb | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
> index 75c190d..a3c9377 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to build and install header and libs into the sdk"
>  LICENSE = "MIT"
> -PR = "r13"
> +PR = "r14"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -12,12 +12,6 @@ QT_TOOLCHAIN_TARGET = "\
>  QT_TOOLCHAIN_TARGET_keystone = ""
>  QT_TOOLCHAIN_TARGET_omapl138 = ""
>  
> -GTK_TOOLCHAIN_TARGET = "\
> -    packagegroup-arago-gtk-sdk-target \
> -"
> -GTK_TOOLCHAIN_TARGET_keystone = ""
> -GTK_TOOLCHAIN_TARGET_omapl138 = ""
> -
>  TISDK_TOOLCHAIN_BASE_TARGET = "\
>      packagegroup-arago-standalone-sdk-target \
>      packagegroup-arago-tisdk-multimedia-sdk-target \
> @@ -32,7 +26,7 @@ TISDK_TOOLCHAIN_EXTRA_TARGET_omapl138 = ""
>  
>  RDEPENDS_${PN} = "\
>      ${QT_TOOLCHAIN_TARGET} \
> -    ${GTK_TOOLCHAIN_TARGET} \
> +    ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-gtk-sdk-target','',d)} \
>      ${TISDK_TOOLCHAIN_BASE_TARGET} \
>      ${TISDK_TOOLCHAIN_EXTRA_TARGET} \
>      ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics-sdk-target','',d)} \
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

