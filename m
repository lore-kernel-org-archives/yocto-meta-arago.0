Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 8D729529D3
	for <meta-arago@arago-project.org>;
	Fri, 20 Sep 2019 18:07:09 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8KI61he026021
	for <meta-arago@arago-project.org>; Fri, 20 Sep 2019 13:06:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569002761;
	bh=DDonEGCb2oS5wdBhF/B/9bJTUjo/ioWxd1v3cqicrwc=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=TjjBcr7kL1QvSBNQyX3HSGXlWsbwXmNw7C9QgbFb2eDhE9E7AItxsJNNjQ4tnyQI9
	bMWzPcT0vcSAYBK7BfaDwOC6oDKYPQ6PvlTsOAqVkPvy37T0JQ6sKzsT80sdJRE8R/
	qI2iHJ5TEU3rN2ucyGK0QW7unXsuv2bBdO+hmw+o=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8KI61TA007062
	for <meta-arago@arago-project.org>; Fri, 20 Sep 2019 13:06:01 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 20 Sep 2019 13:05:56 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 20 Sep 2019 13:05:56 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8KI606W028165;
	Fri, 20 Sep 2019 13:06:00 -0500
To: Hongmei Gou <a0271529@ti.com>, <meta-arago@arago-project.org>
References: <20190909164836.1111-1-a0271529@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <0e2dc9f7-e5ca-620d-0536-808c819674af@ti.com>
Date: Fri, 20 Sep 2019 14:05:56 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190909164836.1111-1-a0271529@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [PATCH v2] packagegroup-arago-tisdk-addons*: add tensorflow-lite
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
X-List-Received-Date: Fri, 20 Sep 2019 18:07:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Please backport this to ti2019.03.


Thank you,

Jake

On 9/9/2019 12:48 PM, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
> v2 change: package tensorflow-lite-examples instead of tensorflow-lite
>
>   .../packagegroup-arago-tisdk-addons-sdk-target.bb      | 10 +++++++++-
>   .../packagegroups/packagegroup-arago-tisdk-addons.bb   |  6 +++++-
>   2 files changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> index 390effba..7ba5143a 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> @@ -1,6 +1,6 @@
>   DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
>   LICENSE = "MIT"
> -PR = "r42"
> +PR = "r43"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
> @@ -159,20 +159,28 @@ EXTRA_PACKAGES = ""
>   EXTRA_PACKAGES_append_ti33x = " voxelsdk-dev \
>                                   arm-compute-library-dev \
>                                   ${ARMNN_PACKAGES} \
> +                                tensorflow-lite-dev \
> +                                tensorflow-lite-staticdev \
>                                   pdm-anomaly-detection-dev \
>   "
>   EXTRA_PACKAGES_append_ti43x = " voxelsdk-dev \
>                                   arm-compute-library-dev \
>                                   ${ARMNN_PACKAGES} \
> +                                tensorflow-lite-dev \
> +                                tensorflow-lite-staticdev \
>                                   pdm-anomaly-detection-dev \
>   "
>   EXTRA_PACKAGES_append_omap-a15 = " voxelsdk-dev \
>                                   arm-compute-library-dev \
>                                   ${ARMNN_PACKAGES} \
> +                                tensorflow-lite-dev \
> +                                tensorflow-lite-staticdev \
>                                   pdm-anomaly-detection-dev \
>   "
>   EXTRA_PACKAGES_append_am65xx = " arm-compute-library-dev \
>                                ${ARMNN_PACKAGES} \
> +                             tensorflow-lite-dev \
> +                             tensorflow-lite-staticdev \
>                                pdm-anomaly-detection-dev \
>   "
>   
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index 3990dad6..52b2a64a 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -1,6 +1,6 @@
>   DESCRIPTION = "Task to install additional utilities/demos for SDKs"
>   LICENSE = "MIT"
> -PR = "r74"
> +PR = "r75"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
> @@ -153,12 +153,14 @@ ARMNN_PACKAGES = "armnn"
>   EXTRA_PACKAGES_append_ti33x = " voxelsdk \
>                                   arm-compute-library \
>                                   ${ARMNN_PACKAGES} \
> +                                tensorflow-lite-examples \
>                                   pdm-anomaly-detection \
>   "
>   
>   EXTRA_PACKAGES_append_ti43x = " voxelsdk \
>                                   arm-compute-library \
>                                   ${ARMNN_PACKAGES} \
> +                                tensorflow-lite-examples \
>                                   pdm-anomaly-detection \
>   "
>   
> @@ -167,11 +169,13 @@ EXTRA_PACKAGES_append_omap-a15 = " voxelsdk \
>                                      big-data-ipc-demo-linux-firmware \
>                                      arm-compute-library \
>                                      ${ARMNN_PACKAGES} \
> +                                   tensorflow-lite-examples \
>                                      pdm-anomaly-detection \
>   "
>   
>   EXTRA_PACKAGES_append_am65xx = " arm-compute-library \
>                                ${ARMNN_PACKAGES} \
> +                             tensorflow-lite-examples \
>                                pdm-anomaly-detection \
>   "
>   

