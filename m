Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id B9C1A52976
	for <meta-arago@arago-project.org>;
	Tue, 27 Feb 2018 18:58:40 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w1RIw7bb007216
	for <meta-arago@arago-project.org>; Tue, 27 Feb 2018 12:58:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519757887;
	bh=guZlFjmFUWaiMP4vldzh4YSIlgN930+YrtQ3tVae5dc=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=vYxURjkZfsxW7dPC32Uwtp7wts0SpohDrThS8gdk6mX0lVhhQoqC/jGaXL/cwsizv
	6Of8OBmGpasfyUVxtW9yIaCprZ4ODPmO0Yyhf/uQn0zKVqJvsMiTBwVk18Y5GlrlNX
	BlX1JL3hIruRo9PdLB3w9HgHJ5Aj7nvosjF2/zpg=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1RIw79X027043
	for <meta-arago@arago-project.org>; Tue, 27 Feb 2018 12:58:07 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 27 Feb 2018 12:58:07 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 27 Feb 2018 12:58:07 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1RIw6Qu002294;
	Tue, 27 Feb 2018 12:58:06 -0600
To: Djordje Senicic <x0157990@ti.com>, <meta-arago@arago-project.org>
References: <1519757440-25574-1-git-send-email-x0157990@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <8636d323-2d05-f34c-74dd-73d6a3bca223@ti.com>
Date: Tue, 27 Feb 2018 13:58:07 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1519757440-25574-1-git-send-email-x0157990@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com
Subject: Re: [EXTERNAL] [meta-processor-sdk] [PATCH] tiovx-app: Fix memory map for DSP firmware
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
X-List-Received-Date: Tue, 27 Feb 2018 18:58:41 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Thank you. This has been pushed.


On 2/27/2018 1:50 PM, Djordje Senicic wrote:
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>   recipes-ti/tiovx/tiovx-sys.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-ti/tiovx/tiovx-sys.inc b/recipes-ti/tiovx/tiovx-sys.inc
> index fc24947..43c4e1d 100644
> --- a/recipes-ti/tiovx/tiovx-sys.inc
> +++ b/recipes-ti/tiovx/tiovx-sys.inc
> @@ -1,5 +1,5 @@
>   PV = "01.00.00.00"
>   
>   BRANCH="master"
> -SRCREV = "c208217c5c3788c78d10ff0d25e5db9782e00be9"
> +SRCREV = "375fa639773970e433171686f01f360a9a5b2ad4"
>   SRC_URI = "git://git.ti.com/processor-sdk/tiovx-app.git;protocol=git;branch=${BRANCH}"


