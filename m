Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 2E297529AE
	for <meta-arago@arago-project.org>;
	Mon, 16 Jul 2018 16:19:00 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6GGIrjv125259
	for <meta-arago@arago-project.org>; Mon, 16 Jul 2018 11:18:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531757933;
	bh=wSdHIJMv3nx7M986usONp6NLM0qeRioyY06spDntkMQ=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=JJUHvMLNXU8cdRsHmlYeQZbW8kSUxpCQ3/bEnV+cq022W1l9cOgG3bJCe+tl7IrXT
	IAI6NWIUh5lUTpTQ/JRG1IK1Fsl3isPptFPAe19vYHkY+AqkuuTE2SAiaHylWLKHUi
	TkTtDjSHCFcLqtTDrBm4mM0xf6hna04YGjJLibzI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6GGIrR4005927
	for <meta-arago@arago-project.org>; Mon, 16 Jul 2018 11:18:53 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 16 Jul 2018 11:18:52 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 16 Jul 2018 11:18:52 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6GGIqOd002617;
	Mon, 16 Jul 2018 11:18:52 -0500
To: Eric Ruei <e-ruei1@ti.com>, <meta-arago@arago-project.org>
References: <1531515971-12324-1-git-send-email-e-ruei1@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <faeeca05-1d7a-4a57-4797-da67976a6bf8@ti.com>
Date: Mon, 16 Jul 2018 12:18:52 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.0
MIME-Version: 1.0
In-Reply-To: <1531515971-12324-1-git-send-email-e-ruei1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [PATCH] dual-camera-demo: bump SRCREV to pick up the workaround for LTS2018
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
X-List-Received-Date: Mon, 16 Jul 2018 16:19:00 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you please apply this to the ti2018.01 branch?


Thank you,

Jake


On 7/13/2018 5:06 PM, Eric Ruei wrote:
> This patch picks up the dual-camera-demo workaround due to the DSS
> changes at LTS2018.
>
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>   .../recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb       | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
> index 15a71af..50a2a38 100644
> --- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
> +++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
> @@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c7ca707704d3354a64feeb4f19f52eb5"
>   DEPENDS += "libdrm cmem"
>   require recipes-core/matrix/matrix-gui-paths.inc
>   
> -PR = "r18"
> +PR = "r19"
>   
>   BRANCH = "master"
> -SRCREV = "3546c21b17fa5f54b6ac6259b56e9a6f23b4e8b1"
> +SRCREV = "b335bdf26b00f6294bcf4807e9022c2c435855b7"
>   
>   SRC_URI = "git://git.ti.com/sitara-linux/dual-camera-demo.git;protocol=git;branch=${BRANCH} \
>              file://desc_dual-camera.html \


