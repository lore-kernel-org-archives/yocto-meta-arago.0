Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 52E1852A3E
	for <meta-arago@arago-project.org>;
	Wed, 20 Sep 2017 18:08:30 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8KI8Ukj032539
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 13:08:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505930910;
	bh=ZnsGghrd2PlDRtL1+2WVo9mVq6lkIoD/GuAMbRGMVXQ=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=WVpDj2eO1Daom/InyQWVimlJgsV2q7fn+WwSVJ1gp3RT4JZ3EORjRM1TpYKZDaZil
	xt9ipzwIEyKEnsajipihK1Wg6wYFZWN81/kt2JIdI+egt6W9zi4weChAFVTcLmPjeC
	HgL1SHNH7f1OZ6WqTqKWFUckKHZjP+l+mqGjpinA=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KI8U1a030948
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 13:08:30 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 20 Sep 2017 13:08:29 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 20 Sep 2017 13:08:30 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KI8Tpn009389;
	Wed, 20 Sep 2017 13:08:29 -0500
To: Manisha Agrawal <manisha.agrawal@ti.com>, <meta-arago@arago-project.org>
References: <20170919214136.18852-1-manisha.agrawal@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <577af47e-4e8f-85a0-995b-5dc176dadfc7@ti.com>
Date: Wed, 20 Sep 2017 14:08:29 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170919214136.18852-1-manisha.agrawal@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [meta-processor-sdk][PATCH v1] protection-relays-hmi : SRCREV update for truncated text fix
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
X-List-Received-Date: Wed, 20 Sep 2017 18:08:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Pushed. Thank you.


On 9/19/2017 5:41 PM, Manisha Agrawal wrote:
> protection-relays-hmi demo has two fixes-
> 1. Adjust font size to fit the text in AM335x Starter Kit EVM
> 2. Force the display  screen order to start with index 0
>
> Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> ---
>   recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb b/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb
> index 7ef73e6..67d42fa 100755
> --- a/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb
> +++ b/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb
> @@ -10,7 +10,7 @@ PR = "r0"
>   BRANCH = "master"
>   SRC_URI = "git://git.ti.com/sitara-linux/protection-relays-hmi.git;protocol=git;branch=${BRANCH}"
>   
> -SRCREV = "c8764aaba365302090179b6720cbfc994e169842"
> +SRCREV = "b116b5628a68ba3b6db88435023cf034504655d3"
>   
>   S = "${WORKDIR}/git"
>   


