Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id CD04D5298B
	for <meta-arago@arago-project.org>;
	Thu, 21 Mar 2019 17:57:06 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2LHus4O048866
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2019 12:56:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553191014;
	bh=4/3xexy5I/h1Vg3/dXwF9slbpTw2FGWP1PeczSMfGXI=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=TF9AHSDYG0VwAOc2igrtktEtt38J1Od4vmyIZqDRSDjx3lN/MQ7PXKgIggjQDbMHJ
	iOQz9Uo4ZyWl64qLFRJouT9aWuh7saMGlsOdQvf/z0E0uZkuQeL81MsL4apE+aEJci
	bicMlKkS3UZSdJNk8Kvyd8ILh4eNP2V8LKnZ1NnY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2LHus1R130490
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2019 12:56:54 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 21 Mar 2019 12:56:53 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Thu, 21 Mar 2019 12:56:53 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2LHurQG027511;
	Thu, 21 Mar 2019 12:56:53 -0500
To: Eric Ruei <e-ruei1@ti.com>, <meta-arago@arago-project.org>
References: <1553187416-4891-1-git-send-email-e-ruei1@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <27689151-2bbf-e71c-3334-ab72517b1e39@ti.com>
Date: Thu, 21 Mar 2019 13:56:53 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.3
MIME-Version: 1.0
In-Reply-To: <1553187416-4891-1-git-send-email-e-ruei1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk][PATCH] linuxptp: bump SRCREV for bug fix
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
X-List-Received-Date: Thu, 21 Mar 2019 17:57:07 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Pushed. Thank you!

On 3/21/2019 12:56 PM, Eric Ruei wrote:
> ti: phc2sys: fix the error/warning messages for -r (REALTIME) option
>
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>   recipes-connectivity/linuxptp/linuxptp_%.bbappend | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-connectivity/linuxptp/linuxptp_%.bbappend b/recipes-connectivity/linuxptp/linuxptp_%.bbappend
> index c2b96ac..7cc76f4 100644
> --- a/recipes-connectivity/linuxptp/linuxptp_%.bbappend
> +++ b/recipes-connectivity/linuxptp/linuxptp_%.bbappend
> @@ -1,11 +1,11 @@
> -PR_append = ".tisdk10"
> +PR_append = ".tisdk11"
>   PV = "1.8+"
>   
>   BRANCH = "ti-linuxptp-release"
>   SRC_URI = "git://git.ti.com/processor-sdk/linuxptp.git;protocol=git;branch=${BRANCH} \
>              file://build-Allow-CC-and-prefix-to-be-overriden.patch"
>   
> -SRCREV = "308be592614861559690c911132c2aed4e2934d8"
> +SRCREV = "2b48bb38da8453df1d57cbe0c58e8bb5551ec83c"
>   
>   S = "${WORKDIR}/git"
>   

