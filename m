Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 09006529A0
	for <meta-arago@arago-project.org>;
	Mon, 25 Feb 2019 18:51:14 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1PIpBBX080530
	for <meta-arago@arago-project.org>; Mon, 25 Feb 2019 12:51:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551120671;
	bh=YEs+89cX7eMmHTfuxpXaIrRSpyeIQLtJln3k1YAGgwE=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=cvi2PXQ0m3+ahEefcPvDgGKX5eiI4JnqR4q1Zwevjk/QYJ9u1a6pBFgyIeq/RftCh
	hngXOlLt9FM1bGRlY6ZnLz3EnQQaJ6NGYzunX8i2b9PFAHqKRnuU/0fcO4yERCj1sD
	dT9JwfUgchbtFq4GSOIngwKUuxBHhWQOXvZ8RHXs=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1PIpBCq087543
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 25 Feb 2019 12:51:11 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 25 Feb 2019 12:51:10 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 25 Feb 2019 12:51:10 -0600
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1PIpANF032513;
	Mon, 25 Feb 2019 12:51:10 -0600
To: Denys Dmytriyenko <denys@ti.com>, <meta-arago@arago-project.org>
References: <20190115215150.7089-1-denys@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <d5c1eec2-02bf-e84d-5ca3-ef116fe37fb4@ti.com>
Date: Mon, 25 Feb 2019 13:51:10 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190115215150.7089-1-denys@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [rocko/master][PATCH] nativesdk-packagegroup-*-host: add option for bare devtool w/o TI OCL, CGT tools
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
X-List-Received-Date: Mon, 25 Feb 2019 18:51:15 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

I just realized that this commit effectively removes these TI toolchains 
from the keystone devkits, "meta-toolchain-arago-tisdk-server".


On 1/15/2019 4:51 PM, Denys Dmytriyenko wrote:
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>   ...k-packagegroup-arago-qte-toolchain-host.bb |  2 +-
>   .../nativesdk-packagegroup-arago-sdk-host.bb  | 13 +----------
>   ...nativesdk-packagegroup-arago-tisdk-host.bb | 22 +++++++++++++++++++
>   3 files changed, 24 insertions(+), 13 deletions(-)
>   create mode 100644 meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
>
> diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb
> index 25d4f156..88736682 100644
> --- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb
> +++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb
> @@ -5,6 +5,6 @@ LICENSE = "MIT"
>   inherit packagegroup nativesdk qt-vars
>   
>   RDEPENDS_${PN} = "\
> -    nativesdk-packagegroup-arago-sdk-host \
> +    nativesdk-packagegroup-arago-tisdk-host \
>       ${QT_RDEPENDS_NATIVESDK_TOOLS} \
>       "
> diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
> index af83521a..4199c2eb 100644
> --- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
> +++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
> @@ -1,21 +1,11 @@
>   SUMMARY = "Host packages for a standalone Arago SDK or external toolchain"
> -PR = "r17"
> +PR = "r18"
>   LICENSE = "MIT"
>   
>   inherit packagegroup nativesdk
>   
>   PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
>   
> -EXTRA_TI_TOOLS = " \
> -    nativesdk-ti-cgt6x \
> -    nativesdk-ti-cgt-pru \
> -    nativesdk-clocl \
> -    nativesdk-clacc \
> -    nativesdk-open62541-examples \
> -    nativesdk-open62541-tests \
> -    nativesdk-tidl-import \
> -"
> -
>   RDEPENDS_${PN} = "\
>       nativesdk-pkgconfig \
>       nativesdk-opkg \
> @@ -28,5 +18,4 @@ RDEPENDS_${PN} = "\
>       nativesdk-git \
>       nativesdk-cmake \
>       nativesdk-mtd-utils-ubifs \
> -    ${EXTRA_TI_TOOLS} \
>   "
> diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
> new file mode 100644
> index 00000000..cb345918
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
> @@ -0,0 +1,22 @@
> +SUMMARY = "Host packages for a standalone Arago SDK with TI tools"
> +PR = "r0"
> +LICENSE = "MIT"
> +
> +inherit packagegroup nativesdk
> +
> +PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
> +
> +EXTRA_TI_TOOLS = " \
> +    nativesdk-ti-cgt6x \
> +    nativesdk-ti-cgt-pru \
> +    nativesdk-clocl \
> +    nativesdk-clacc \
> +    nativesdk-open62541-examples \
> +    nativesdk-open62541-tests \
> +    nativesdk-tidl-import \
> +"
> +
> +RDEPENDS_${PN} = "\
> +    nativesdk-packagegroup-arago-sdk-host \
> +    ${EXTRA_TI_TOOLS} \
> +"

