Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 24D0452998
	for <meta-arago@arago-project.org>;
	Tue, 20 Mar 2018 21:26:54 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2KLPrb4001859
	for <meta-arago@arago-project.org>; Tue, 20 Mar 2018 16:25:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521581153;
	bh=AMZrLeZIp56p/nOxz6TKxngNmuJXIEXfIQ0BK2YfvgI=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=ToiPoe89dmev5iD/T7JWDpnMu/TYhue7JZUPiuFNLScl9iNru/aJMvBFhielNG5aD
	LYEJ88MPNSDOI5cjtREenNPevs/2PGmA41HOB1cwfAfHZzDIQqOCenwXaC4LnUn7UB
	zdSB+P37+plnMGjs3cI/6PtVX5r1bwNpJSbER3cs=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2KLPrfX025352
	for <meta-arago@arago-project.org>; Tue, 20 Mar 2018 16:25:53 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 20 Mar 2018 16:25:53 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 20 Mar 2018 16:25:53 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2KLPr2F023932;
	Tue, 20 Mar 2018 16:25:53 -0500
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>,
	<meta-arago@arago-project.org>
References: <1521579632-31441-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <629d7d6f-cff6-618e-ff62-7d6cc2dace74@ti.com>
Date: Tue, 20 Mar 2018 17:25:53 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1521579632-31441-1-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH] posix-smp-demo: Updating to version 01.01.00.00
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
X-List-Received-Date: Tue, 20 Mar 2018 21:26:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/20/2018 5:00 PM, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>   recipes-apps/posix-smp-demo/posix-smp-demo-01.01.00.00.inc   | 5 +++++
>   recipes-apps/posix-smp-demo/posix-smp-demo-rtos_git.bbappend | 1 +
>   recipes-apps/posix-smp-demo/posix-smp-demo_git.bbappend      | 1 +
>   3 files changed, 7 insertions(+)
>   create mode 100644 recipes-apps/posix-smp-demo/posix-smp-demo-01.01.00.00.inc
>   create mode 100644 recipes-apps/posix-smp-demo/posix-smp-demo-rtos_git.bbappend

There is no posix-smp-demo-rtos recipe for this bbappend.

>   create mode 100644 recipes-apps/posix-smp-demo/posix-smp-demo_git.bbappend
>
> diff --git a/recipes-apps/posix-smp-demo/posix-smp-demo-01.01.00.00.inc b/recipes-apps/posix-smp-demo/posix-smp-demo-01.01.00.00.inc
> new file mode 100644
> index 0000000..2058ada
> --- /dev/null
> +++ b/recipes-apps/posix-smp-demo/posix-smp-demo-01.01.00.00.inc
> @@ -0,0 +1,5 @@
> +# Below commit ID corresponds to "DEV.POSIX-SMP.01.01.00.00"
> +POSIX_SMP_SRCREV = "139fe7ec58939dc2743355e5fede0735f8693ebd"
> +
> +PV = "01.01.00.00"
> +INC_PR = "r0"
> diff --git a/recipes-apps/posix-smp-demo/posix-smp-demo-rtos_git.bbappend b/recipes-apps/posix-smp-demo/posix-smp-demo-rtos_git.bbappend
> new file mode 100644
> index 0000000..e7b3dce
> --- /dev/null
> +++ b/recipes-apps/posix-smp-demo/posix-smp-demo-rtos_git.bbappend
> @@ -0,0 +1 @@
> +require recipes-apps/posix-smp-demo/posix-smp-demo-01.01.00.00.inc
> diff --git a/recipes-apps/posix-smp-demo/posix-smp-demo_git.bbappend b/recipes-apps/posix-smp-demo/posix-smp-demo_git.bbappend
> new file mode 100644
> index 0000000..e7b3dce
> --- /dev/null
> +++ b/recipes-apps/posix-smp-demo/posix-smp-demo_git.bbappend
> @@ -0,0 +1 @@
> +require recipes-apps/posix-smp-demo/posix-smp-demo-01.01.00.00.inc


