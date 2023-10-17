Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9623ACDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 09:22:57 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.202822.1697534576161894511
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 02:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=VXFvlXiV;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39H9MktV118620;
	Tue, 17 Oct 2023 04:22:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697534566;
	bh=hxTc1BS1tVgyGu9wSF+B5hlkrtchQG5Z9qzcIR+WSe4=;
	h=Date:Subject:To:References:CC:From:In-Reply-To;
	b=VXFvlXiVq2Lvt2KCCDYUgDBAxZgoNqztCBG/wx97b9hCRw6WsTWPzkZ9EmbrEcp8w
	 QszNkQynXYUw9FRquL21NhEWs9u14UfSWBhtIO6lELKAn7pFCF5rohQ3UoTXuxU124
	 9nl99oHgoAmJnoWnXuvXLYU3szdQ/DpsbW2ikJA0=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39H9MkN2052407
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Oct 2023 04:22:46 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 17
 Oct 2023 04:22:45 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 17 Oct 2023 04:22:46 -0500
Received: from [172.24.227.238] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39H9MhbV004224;
	Tue, 17 Oct 2023 04:22:44 -0500
Message-ID: <ecff143a-22fe-4033-97ca-5ee6b884672a@ti.com>
Date: Tue, 17 Oct 2023 14:52:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago][master/kirkstone][PATCH 2/2]
 shadow-securetty: Do not allow root login over telnet
Content-Language: en-US
To: <meta-arago@lists.yoctoproject.org>
References: <20231016211840.23815-1-afd@ti.com>
 <20231016211840.23815-2-afd@ti.com>
CC: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        Andrew
 Davis <afd@ti.com>, Gyan Gupta <g-gupta@ti.com>,
        Khasim <khasim@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20231016211840.23815-2-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Oct 2023 09:22:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14940


On 17/10/23 02:48, Andrew Davis via lists.yoctoproject.org wrote:
> I'm sure I don't have to explain why this was a bad idea..

Still, It will be good to have a commit message explaining it :)

>
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   .../shadow/shadow-securetty_%.bbappend            | 15 ---------------
>   1 file changed, 15 deletions(-)
>   delete mode 100644 meta-arago-distro/recipes-extended/shadow/shadow-securetty_%.bbappend
>
> diff --git a/meta-arago-distro/recipes-extended/shadow/shadow-securetty_%.bbappend b/meta-arago-distro/recipes-extended/shadow/shadow-securetty_%.bbappend
> deleted file mode 100644
> index 62999d2a..00000000
> --- a/meta-arago-distro/recipes-extended/shadow/shadow-securetty_%.bbappend
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -PR:append = ".arago0"
> -
> -do_install:append () {
> -    # Allow telnet sessions to login as root
> -    securetty_file=${D}${sysconfdir}/securetty
> -
> -    echo '' >> $securetty_file
> -    echo '# Allow 5 telnet login' >> $securetty_file
> -    echo 'pts/0' >> $securetty_file
> -    echo 'pts/1' >> $securetty_file
> -    echo 'pts/2' >> $securetty_file
> -    echo 'pts/3' >> $securetty_file
> -    echo 'pts/4' >> $securetty_file
> -
> -}

