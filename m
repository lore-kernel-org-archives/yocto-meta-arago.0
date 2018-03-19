Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 791C052970
	for <meta-arago@arago-project.org>;
	Mon, 19 Mar 2018 17:48:15 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2JHlHaM025188
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 12:47:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521481637;
	bh=vxVzPVXWbWveWCaCkMIZ2Q8FelZKQzL0U/PDOjSG8wg=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=lGkd3pn/O3ECCh+PXzXI9AftOuURKR1jYQhyCnZOd+IQSYyBsoIZ1MqTvzgN5WGm3
	rwDyj76ZJlxYkiILCxDPOu9kjEiMLN5qCRofZwFiCge8LRx3gNhkBnCtVuTuEa4/Ky
	TsKV58JVIFQHMZCjZIU8h4uck+7uDIqLLdpCAY3w=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JHlHO1005848
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 12:47:17 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 19 Mar 2018 12:47:16 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 19 Mar 2018 12:47:16 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JHlGbA004288;
	Mon, 19 Mar 2018 12:47:16 -0500
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>,
	<meta-arago@arago-project.org>
References: <1521475559-24416-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <b3fa7880-b496-04e1-0701-bd9a0413d741@ti.com>
Date: Mon, 19 Mar 2018 13:47:16 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1521475559-24416-1-git-send-email-m-radhakrishnan2@ti.com>
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
X-List-Received-Date: Mon, 19 Mar 2018 17:48:15 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 3/19/2018 12:05 PM, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>   meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc b/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc
> index b0abd2b..3d78727 100644
> --- a/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc
> +++ b/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc
                 ^^^^^^^^^^^^^^^^^
This does not appear to be for meta-processor-sdk.

> @@ -7,14 +7,14 @@ POSIX_SMP_GIT_URI = "git://git.ti.com/keystone-demos/posix-smp.git"
>   POSIX_SMP_GIT_PROTOCOL = "git"
>   POSIX_SMP_GIT_BRANCH = "master"
>   
> -# Below commit ID corresponds to "DEV.POSIX-SMP.01.00.01.07"
> -POSIX_SMP_SRCREV = "2614d4cbe9d83c8345e051c7f3767f86226398ea"
> +# Below commit ID corresponds to "DEV.POSIX-SMP.01.01.00.00"
> +POSIX_SMP_SRCREV = "139fe7ec58939dc2743355e5fede0735f8693ebd"
>   
>   BRANCH = "${POSIX_SMP_GIT_BRANCH}"
>   SRC_URI = "${POSIX_SMP_GIT_URI};protocol=${POSIX_SMP_GIT_PROTOCOL};branch=${BRANCH}"
>   
>   SRCREV = "${POSIX_SMP_SRCREV}"
> -PV = "01.00.01.07"
> +PV = "01.01.00.00"
>   INC_PR = "r0"
>   
>   S = "${WORKDIR}/git"


