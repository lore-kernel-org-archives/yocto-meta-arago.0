Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 2430652A16
	for <meta-arago@arago-project.org>;
	Mon, 23 Jul 2018 20:03:01 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6NK2sMs048893
	for <meta-arago@arago-project.org>; Mon, 23 Jul 2018 15:02:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532376174;
	bh=vARRQ1vgStCeAjf1/OAwZL5b+cPqctDD+OEWMTHGOcY=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=DwLl2u3/8ZIZItbxIRWrJL7A0EFByrVMIftYnYgZUCU7+d/6glw32AxEJt+o3ADux
	zWycwE4ZzS7+4xsCh74yQzcsfRSodgVnzH+WTFZw2u0ItOmlPbXenuzBBjD/YI7cw4
	+GpmYcTbTRbfFAexPKvWfRGJ2S4k4ypWt7Ha22sA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6NK2sLs010338
	for <meta-arago@arago-project.org>; Mon, 23 Jul 2018 15:02:54 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 23 Jul 2018 15:02:53 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 23 Jul 2018 15:02:53 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6NK2rp0030895;
	Mon, 23 Jul 2018 15:02:53 -0500
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>,
	<meta-arago@arago-project.org>
References: <1532021413-49029-1-git-send-email-m-radhakrishnan2@ti.com>
	<1532021413-49029-2-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <f970c363-16ed-5e15-3956-c75da7e97b01@ti.com>
Date: Mon, 23 Jul 2018 16:02:53 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.0
MIME-Version: 1.0
In-Reply-To: <1532021413-49029-2-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [master][PATCH] posix-smp-demo: SRCREV bump to 1.1.0.1
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
X-List-Received-Date: Mon, 23 Jul 2018 20:03:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

ACK


Denys,

Can you please apply this to the ti2018.01 branch?


Thank you,
Jake


On 7/19/2018 1:30 PM, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>   meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc b/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc
> index 3d78727..b89ebd4 100644
> --- a/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc
> +++ b/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc
> @@ -7,14 +7,14 @@ POSIX_SMP_GIT_URI = "git://git.ti.com/keystone-demos/posix-smp.git"
>   POSIX_SMP_GIT_PROTOCOL = "git"
>   POSIX_SMP_GIT_BRANCH = "master"
>   
> -# Below commit ID corresponds to "DEV.POSIX-SMP.01.01.00.00"
> -POSIX_SMP_SRCREV = "139fe7ec58939dc2743355e5fede0735f8693ebd"
> +# Below commit ID corresponds to "DEV.POSIX-SMP.01.01.00.01"
> +POSIX_SMP_SRCREV = "99834751f63f8f418e659b251f10e8e13b900881"
>   
>   BRANCH = "${POSIX_SMP_GIT_BRANCH}"
>   SRC_URI = "${POSIX_SMP_GIT_URI};protocol=${POSIX_SMP_GIT_PROTOCOL};branch=${BRANCH}"
>   
>   SRCREV = "${POSIX_SMP_SRCREV}"
> -PV = "01.01.00.00"
> +PV = "01.01.00.01"
>   INC_PR = "r0"
>   
>   S = "${WORKDIR}/git"


