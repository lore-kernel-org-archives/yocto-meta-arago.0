Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id DC1E7529A2
	for <meta-arago@arago-project.org>;
	Wed, 21 Mar 2018 13:20:28 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2LDKRWS009835
	for <meta-arago@arago-project.org>; Wed, 21 Mar 2018 08:20:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521638427;
	bh=NyWZOyQpjKIEJx4iP7fUeCfEy6OMCsOs4SgpeSEmEeg=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=JD7snTlKSfnrPyy4DR6wVq3jhI1H5fkfE8fo2y16LM9AKfFpiU1Bq06YK+6pdZjQj
	UrWv8cLExCukF87OMQTkbLtyC9s37qqABSQCaJwL1OwxYSJPiE9HLawPwjDodd1PvP
	kK5MyQFsYAE7uLm/cqjirWub55RZQqmk676gNOgs=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2LDKRP1023881
	for <meta-arago@arago-project.org>; Wed, 21 Mar 2018 08:20:27 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 21 Mar 2018 08:20:27 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 21 Mar 2018 08:20:27 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2LDKRfG018350;
	Wed, 21 Mar 2018 08:20:27 -0500
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>,
	<meta-arago@arago-project.org>
References: <1521637792-32939-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <1333a91d-8b81-0498-f6a3-fd80230c0707@ti.com>
Date: Wed, 21 Mar 2018 09:20:26 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1521637792-32939-1-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH v2] posix-smp-demo: Updating to version 01.01.00.00
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
X-List-Received-Date: Wed, 21 Mar 2018 13:20:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Pushed. Thank you.


On 3/21/2018 9:09 AM, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>   v2 - Excluding the rtos bbappend from the v1 patch
>
>   recipes-apps/posix-smp-demo/posix-smp-demo-01.01.00.00.inc | 5 +++++
>   recipes-apps/posix-smp-demo/posix-smp-demo_git.bbappend    | 1 +
>   2 files changed, 6 insertions(+)
>   create mode 100644 recipes-apps/posix-smp-demo/posix-smp-demo-01.01.00.00.inc
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
> diff --git a/recipes-apps/posix-smp-demo/posix-smp-demo_git.bbappend b/recipes-apps/posix-smp-demo/posix-smp-demo_git.bbappend
> new file mode 100644
> index 0000000..e7b3dce
> --- /dev/null
> +++ b/recipes-apps/posix-smp-demo/posix-smp-demo_git.bbappend
> @@ -0,0 +1 @@
> +require recipes-apps/posix-smp-demo/posix-smp-demo-01.01.00.00.inc


