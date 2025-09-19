Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C3FCAC59A
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 06:51:45 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.10123.1758264702869965083
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 23:51:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=LKJC8nFu;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: a-limaye@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58J6pgwO185802
	for <meta-arago@lists.yoctoproject.org>; Fri, 19 Sep 2025 01:51:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758264702;
	bh=xe1U1+KAXbX3+qGyMw9DB22BvyO6hYPVrTcCdYEj9kU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=LKJC8nFuDnRReKbShcN0lNe3jkYS9Ra5+eDn8MEjMnjxVvrSoA4WyCWgPy02JTyX6
	 jLbCRIBe2siw70Q5JgAGugbfl7KUT/E8LN7Yd+jRn+kYseKLc/U6Oqd4QvcgYNa1IF
	 k0xU6ky/Aj2sD57sGxghYY5XYeq0CKnjmgC9BjSQ=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58J6pgA93748404
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 19 Sep 2025 01:51:42 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 19
 Sep 2025 01:51:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Sep 2025 01:51:41 -0500
Received: from [172.24.234.127] (psdkl-workstation0.dhcp.ti.com [172.24.234.127])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58J6pdeQ2155363;
	Fri, 19 Sep 2025 01:51:40 -0500
Message-ID: <7e4db8d7-4fec-46f5-a99e-0f6486518e4e@ti.com>
Date: Fri, 19 Sep 2025 12:21:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk-linux:
 Add 11.01.02.01 release config
To: Beleswar Padhi <b-padhi@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <u-kumar1@ti.com>
References: <20250919051922.3101673-1-b-padhi@ti.com>
Content-Language: en-US
From: Aniket Limaye <a-limaye@ti.com>
In-Reply-To: <20250919051922.3101673-1-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 19 Sep 2025 06:51:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16599

Beleswar,

oe-layersetup structure has changed... to support multiple layersetup 
tools, including the existing shell script.

These various tools need this yocto layer config in diff formats like 
json, yml, etc.
So there is a script to convert the yocto config .txt to all of those 
formats. Please run that script and resend the patch

Refer https://git.ti.com/cgit/arago-project/oe-layersetup/tree/README#n62

You can find examples in recent release-config-addition-commits.

Thanks,
Aniket

On 19/09/25 10:49, Beleswar Padhi wrote:
> Add release config for SDK 11.01.02.01 which will be used by AM57x and
> AM57x-HS platforms.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
>   .../processor-sdk-linux-11_01_02_01.txt       | 21 +++++++++++++++++++
>   1 file changed, 21 insertions(+)
>   create mode 100644 configs/processor-sdk-linux/processor-sdk-linux-11_01_02_01.txt
> 
> diff --git a/configs/processor-sdk-linux/processor-sdk-linux-11_01_02_01.txt b/configs/processor-sdk-linux/processor-sdk-linux-11_01_02_01.txt
> new file mode 100644
> index 0000000..9199dec
> --- /dev/null
> +++ b/configs/processor-sdk-linux/processor-sdk-linux-11_01_02_01.txt
> @@ -0,0 +1,21 @@
> +# This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> +
> +bitbake,https://git.openembedded.org/bitbake,2.8,982645110a19ebb94d519926a4e14c8a2a205cfd
> +meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,67c473bc6d88a2cce13b2e8c36fcb79cb0015339,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
> +#meta-browser,https://github.com/OSSystems/meta-browser.git,master,27ca52f635a31f5f9762813a8527dd31323549b7,layers=meta-chromium
> +#meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
> +meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,ade45671712b72e988d622caab51774f5a069c32,layers=
> +meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,af1db2042caf8021d767dce1b26c08b59b96f3d1,layers=
> +meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,c29a18fa39ede952f3f6108ec007c1906e2d9a0d,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
> +meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,a8046d5ec53b1856169ac795aa87cb0d5db84c04,layers=
> +meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,0e2876e2ea7c28ddff5bc0052bdbc83dd07b7c98,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
> +meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,0f1e7bf92c89759f0ab74cfa5be4ee47b092ad46,layers=meta-arm:meta-arm-toolchain
> +meta-clang,https://github.com/kraj/meta-clang,scarthgap,057ee563305e9484b29d02347aeafdadc5ea28ed,layers=
> +#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap,HEAD,layers=.:meta-flutter-apps
> +oe-core,https://git.openembedded.org/openembedded-core,scarthgap,baa5e7ea5f37f54c2a00080798ad7fb4c0664f69,layers=meta
> +meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,am57x,982761ae3031c12ab7c270fb4e91b15198795299,layers=meta-ti-foundational
> +
> +OECORELAYERCONF=./sample-files/bblayers.conf.sample
> +OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
> +BITBAKE_INCLUSIVE_VARS=yes


