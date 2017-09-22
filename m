Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id D962452A2B
	for <meta-arago@arago-project.org>;
	Fri, 22 Sep 2017 00:06:10 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8M06A8c031646
	for <meta-arago@arago-project.org>; Thu, 21 Sep 2017 19:06:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506038770;
	bh=22RT1nod9eCR5Ccj5Eh6xIQZQlxf0W3xKyVUfRVx1Jc=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=Tkp5b2wJ+2DHM6fpe0dDuRZ9jd0UgYdrgiPNAtYpTBWil832Vk7STjT0gYP7LdkOi
	Wndai/1gttY2g+8OOh+wsp+sU92JJJ4U9jBw/2CWIloYAGGpipy8fRQ7iR0p6Q+KyK
	+tBbQA5VbspJ6NrLWmeCI8TKQIvY9AW9/LdaomBM=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8M06Ao9026008
	for <meta-arago@arago-project.org>; Thu, 21 Sep 2017 19:06:10 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 21 Sep 2017 19:06:10 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 21 Sep 2017 19:06:10 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8M068Q0031248;
	Thu, 21 Sep 2017 19:06:10 -0500
To: Djordje Senicic <x0157990@ti.com>, <meta-arago@arago-project.org>
References: <1506033246-18916-1-git-send-email-x0157990@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <49db0a81-bad8-30b2-0bfe-e60a8f4aa78c@ti.com>
Date: Thu, 21 Sep 2017 20:06:09 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506033246-18916-1-git-send-email-x0157990@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com
Subject: Re: [EXTERNAL] [meta-processor-sdk][PATCH v2 0/5] tiovx: Add TIOVX (OpenVX), host side
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
X-List-Received-Date: Fri, 22 Sep 2017 00:06:11 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

I fixed up these with the "ti-paths-append" --> "tisdk-paths" and pushed 
to meta-processor-sdk.


On 9/21/2017 6:34 PM, Djordje Senicic wrote:
> * TIOVX-SYS-IFACE includes API between TIOVX framework and IPC implementation, and DSP firmware (includes kernels and DSP-side of TIOVX framework)
> * TIOVX is TI’s implementation of OpenVX Khronos Standard. TIOVX allows users to create vision and compute applications using OpenVX API and can be executed on TI SoCs.
>    TIOVX also provides optimized OpenVX kernels for C66x DSP. An extension API allows users to integrate their own natively developed custom kernels and call them using OpenVX APIs.
> * TIOVX-APP includes sample TIOVX applications (e.g. conformance tests) and IPC implementation
>
>
> Djordje Senicic (5):
>    tiovx-sys-iface: Add interface header files between TIOVX library and
>      IPC implementation
>    tiovx-lib-host:Add recipe for TI OpenVX library, host side
>    tiovx-app-host:Add recipe for TI OpenVX IPC HOST implementation and
>      sample application for running OpenVX conformance tests.
>    packagegroup-arago-tisdk-addons-sdk-target: add tiovx to devkit
>    packagegroup-arago-tisdk-addons: add tiovx-app
>
>   ...agegroup-arago-tisdk-addons-sdk-target.bbappend |   6 +
>   .../packagegroup-arago-tisdk-addons.bbappend       |   2 +
>   recipes-ti/includes/tisdk-paths.inc                |   3 +
>   ...hs-for-Yocto-build-and-add-RTOS-build-var.patch | 133 +++++++++++++++++++++
>   recipes-ti/tiovx/tiovx-app-host.bb                 |  33 +++++
>   recipes-ti/tiovx/tiovx-lib-host.bb                 |  41 +++++++
>   recipes-ti/tiovx/tiovx-sys-iface.bb                |  32 +++++
>   recipes-ti/tiovx/tiovx-sys.inc                     |   5 +
>   8 files changed, 255 insertions(+)
>   create mode 100644 recipes-ti/tiovx/files/0001-Fix-paths-for-Yocto-build-and-add-RTOS-build-var.patch
>   create mode 100644 recipes-ti/tiovx/tiovx-app-host.bb
>   create mode 100644 recipes-ti/tiovx/tiovx-lib-host.bb
>   create mode 100644 recipes-ti/tiovx/tiovx-sys-iface.bb
>   create mode 100644 recipes-ti/tiovx/tiovx-sys.inc
>


