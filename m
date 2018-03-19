Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 2E7B152998
	for <meta-arago@arago-project.org>;
	Mon, 19 Mar 2018 18:17:09 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2JIGAXj029847
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 13:16:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521483370;
	bh=L8h4sy0QM9kbGCLcLqXRzZz0YpzWVVl7sNWy3ZyzvL4=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=RfzjeF9KO0kUsPgMDL1BLlsc4O7gIOs2DleatEFLO+EZMfpbpybC4sBJh9oROv0hN
	IaR/c6cotb0fi167RhpR+LY2e1phsIIbPhlOBVWEOBKdX7iqTW4OAG9Q7EfEjZoYB1
	Kmy0nwtZYwScrkNDKde7PId/NHN+0Opvgt90N37Y=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JIGAj2015723
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 13:16:10 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 19 Mar 2018 13:16:10 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 19 Mar 2018 13:16:10 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JIGARn012247;
	Mon, 19 Mar 2018 13:16:10 -0500
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>,
	<meta-arago@arago-project.org>
References: <1521483111-25020-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <a039050c-1037-cc8d-dccd-16f018352f7b@ti.com>
Date: Mon, 19 Mar 2018 14:16:10 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1521483111-25020-1-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [morty][PATCH] posix-smp-demo: Updating to version 01.01.00.00
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
X-List-Received-Date: Mon, 19 Mar 2018 18:17:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Any reason this should not also go to rocko/master?


On 3/19/2018 2:11 PM, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>   meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc b/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc
> index b0abd2b..3d78727 100644
> --- a/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc
> +++ b/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc
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


