Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id C9C50529AF
	for <meta-arago@arago-project.org>;
	Mon, 17 Sep 2018 12:32:28 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8HCWKAc109570
	for <meta-arago@arago-project.org>; Mon, 17 Sep 2018 07:32:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537187540;
	bh=yPKjnE/7YYoCfb4snS0ouQp0JdnfPjtn7qb6aUSyB9Y=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=k/hogsg2Y5c0Z6oMrDHmL3XoDHtCG5dhzVZgUnrAGUYOUwL24od5P8aC4wtyDPA2T
	q/tAdMZpj4cB08I4c8OOEMjLb5CXfWwuUEakq5HhkuUWbiOdw9EAeWwDsoxolrvfbo
	Gj244L2TLA4Z/ayUBNT0hUV6o7ALwdAG+oVl+RCI=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8HCWKDa028940
	for <meta-arago@arago-project.org>; Mon, 17 Sep 2018 07:32:20 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 17 Sep 2018 07:32:20 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 17 Sep 2018 07:32:19 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8HCWJti002963;
	Mon, 17 Sep 2018 07:32:19 -0500
To: Eric Ruei <e-ruei1@ti.com>, <meta-arago@arago-project.org>
References: <1537187430-57902-1-git-send-email-e-ruei1@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <4b65438d-1403-33ad-d980-a900c29d06e2@ti.com>
Date: Mon, 17 Sep 2018 08:32:19 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1537187430-57902-1-git-send-email-e-ruei1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [PATCH] packagegroup-arago-tidsk-hmi-sdk-host: add evse demo source for k3 devices
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
X-List-Received-Date: Mon, 17 Sep 2018 12:32:29 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Please also add the ti-tisdk-makefile fragment and verify that it works 
correctly.

- Jake


On 9/17/2018 8:30 AM, Eric Ruei wrote:
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>   .../packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb          | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
> index 4921147..dd3407d 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
> @@ -1,6 +1,6 @@
>   SUMMARY = "Task to add HMI related sources into the SDK"
>   LICENSE = "MIT"
> -PR = "r0"
> +PR = "r1"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
> @@ -22,6 +22,10 @@ HMI_append_omap-a15 = " \
>       evse-hmi-src \
>   "
>   
> +HMI_append_k3 = " \
> +    evse-hmi-src \
> +"
> +
>   RDEPENDS_${PN} = "\
>       ${HMI} \
>   "


