Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 8FB6A52976
	for <meta-arago@arago-project.org>;
	Thu, 21 Mar 2019 13:39:58 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2LDdjBF078525
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2019 08:39:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553175585;
	bh=oxg2IqIKAL52tG8uK4BTiUCRRXoRcNBayawC+U7ujSs=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=k4GhTx6CyLWgmgqv0xxUgNUbCkdhsX9CKHn5TwXAltrlV8GCF0JNI43vOqv6XO5qG
	Gm+mKonzLPOoEyy0AsZX9JmrwwMzNTaYmkkyRvFhNvuF59VIQqDuzGCjJdZ0BVwKbZ
	dZK5guWo8KpEsxVXvHrTxRO8MKCeKGDJ8uGy67Q8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2LDdjTk090957
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2019 08:39:45 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 21 Mar 2019 08:39:45 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Thu, 21 Mar 2019 08:39:45 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2LDdif1018358;
	Thu, 21 Mar 2019 08:39:44 -0500
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>,
	<meta-arago@arago-project.org>
References: <1553174865-28991-1-git-send-email-m-radhakrishnan2@ti.com>
	<1553174865-28991-2-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <f0979472-73ea-670a-5ec7-aab74bab8da5@ti.com>
Date: Thu, 21 Mar 2019 09:39:44 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.3
MIME-Version: 1.0
In-Reply-To: <1553174865-28991-2-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [master][meta-processor-sdk][PATCH 1/7] board-rtos: Superseded by meta-ti update
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
X-List-Received-Date: Thu, 21 Mar 2019 13:39:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Thank you!

Can these be applied now, or do they need to wait for the meta-ti 
patches to be applied?


- Jake

On 3/21/2019 9:27 AM, Mahesh Radhakrishnan wrote:
> ---
>   recipes-bsp/board-rtos/board-rtos_git.bbappend | 5 -----
>   1 file changed, 5 deletions(-)
>   delete mode 100644 recipes-bsp/board-rtos/board-rtos_git.bbappend
>
> diff --git a/recipes-bsp/board-rtos/board-rtos_git.bbappend b/recipes-bsp/board-rtos/board-rtos_git.bbappend
> deleted file mode 100644
> index f6c2182..0000000
> --- a/recipes-bsp/board-rtos/board-rtos_git.bbappend
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -# Below commit ID corresponds to "DEV.BOARD.01.00.10.03A"
> -BOARD_SRCREV = "11c30b5acac3ff61757981a382d7da5c514cd3ff"
> -
> -PV = "01.00.10.03A"
> -PR = "r1"

