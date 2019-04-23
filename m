Return-Path: <dmurphy@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 7A62D52987
	for <meta-arago@arago-project.org>;
	Tue, 23 Apr 2019 18:41:07 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3NIehtV014329
	for <meta-arago@arago-project.org>; Tue, 23 Apr 2019 13:40:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1556044843;
	bh=KpvE5NXV29fQrFkwDmj+IA47bfcu7TlQqgrH+0t/vMU=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=BA+H8l3mUNmNF1p4scI8uN7Hgb8wxQqADB/SEQkAt7hyawxaKAcd7Kl+KmoDF0g+S
	MTg9xNktFwqXjcbYYdaQ2oETeAuK9g8mOY08X5Lrv936znRoMER71e5zPAy41Y2u3d
	LxMQLJv7PAJXaWaaINUjbgB+X9EA3fQvAvRrsUDE=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3NIehdm052541
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 23 Apr 2019 13:40:43 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 23 Apr 2019 13:40:43 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 23 Apr 2019 13:40:43 -0500
Received: from [10.250.90.63] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3NIehxL063612;
	Tue, 23 Apr 2019 13:40:43 -0500
To: <meta-arago@arago-project.org>, <denys@ti.com>, "Davis, Andrew"
	<afd@ti.com>
References: <20190423183835.17911-1-dmurphy@ti.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <4c8d1973-2b34-77d6-73cd-c49e5a74eb1b@ti.com>
Date: Tue, 23 Apr 2019 13:40:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190423183835.17911-1-dmurphy@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [PATCH] optee-os: Update OPTEE OS tag to 3.5.0-rc1 and ti2019.01-rc1
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
X-List-Received-Date: Tue, 23 Apr 2019 18:41:07 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

+Andrew

On 4/23/19 1:38 PM, Dan Murphy wrote:
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../recipes-security/optee/optee-os_git.bbappend              | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> index 2204a50c..ee87b3c7 100644
> --- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> +++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> @@ -2,7 +2,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
>  PR_append = ".arago0"
>  
> -PV = "3.2.0+git${SRCPV}"
> +PV = "3.5.0+git${SRCPV}"
>  
>  is_armv7 = "1"
>  is_armv7_aarch64 = "0"
> @@ -11,7 +11,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
>             file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
>  "
>  BRANCH = "ti_optee_os"
> -SRCREV = "48952f9f76d885df4cb65f8479a4cf7dedf0ee54"
> +SRCREV = "b38f935200f67f9408d7c5d99fe703e5cc806c65"
>  
>  ARMCORE = "CFG_ARM32_core=y ta-targets=ta_arm32"
>  ARMCORE_aarch64 = "CFG_ARM64_core=y ta-targets=ta_arm64"
> 

