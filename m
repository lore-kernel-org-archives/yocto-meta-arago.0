Return-Path: <dmurphy@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 7B61352985
	for <meta-arago@arago-project.org>;
	Wed, 24 Apr 2019 00:14:30 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3O0E6YU043743
	for <meta-arago@arago-project.org>; Tue, 23 Apr 2019 19:14:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1556064846;
	bh=kM61XI9j+7KFq/44XdP6LI2UINpDLlCqqK3SJYRyibA=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=gng4Kgikt57CfzwgTBRu6C52wBXPZHv5kO8Wwm0k56OsJhIubf5gUowvQhIDK3N1G
	fBJdISsWw/u7agY5Qb7Sd5rinZw05zdTjh7DwwY93ZVmnjyW31lKR4kaZXOajT8AEK
	r9dcS1TyvcFT1LKvwGR2IcNi04wAybr/8ECHcuL8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3O0E6Xh113613
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 23 Apr 2019 19:14:06 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 23 Apr 2019 19:14:06 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 23 Apr 2019 19:14:06 -0500
Received: from [10.250.90.63] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3O0E5NI002391;
	Tue, 23 Apr 2019 19:14:06 -0500
To: <meta-arago@arago-project.org>, <denys@ti.com>, "Davis, Andrew"
	<afd@ti.com>
References: <20190424001324.16879-1-dmurphy@ti.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <de49e72c-0cae-8e86-c75b-346a031413f6@ti.com>
Date: Tue, 23 Apr 2019 19:14:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190424001324.16879-1-dmurphy@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [PATCH v2] optee-os: Update OPTEE OS tag to 3.5.0-rc1 and ti2019.01-rc1
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
X-List-Received-Date: Wed, 24 Apr 2019 00:14:30 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Denys

On 4/23/19 7:13 PM, Dan Murphy wrote:
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../recipes-security/optee/optee-os_git.bbappend              | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Not sure where to update the LICENSE checksum that was provided by Andrew

> diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> index cdf3ef6b..a468a12f 100644
> --- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> +++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> @@ -2,7 +2,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
>  PR_append = ".arago1"
>  
> -PV = "3.4.0+git${SRCPV}"
> +PV = "3.5.0+git${SRCPV}"
>  
>  is_armv7 = "1"
>  is_armv7_aarch64 = "0"
> @@ -11,7 +11,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
>             file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
>  "
>  BRANCH = "ti_optee_os"
> -SRCREV = "b01970c6081fcbbc79ef1d3c417ddd5b05df7656"
> +SRCREV = "b38f935200f67f9408d7c5d99fe703e5cc806c65"
>  
>  ARMCORE = "CFG_ARM32_core=y ta-targets=ta_arm32"
>  ARMCORE_aarch64 = "CFG_ARM64_core=y ta-targets=ta_arm64"
> 

