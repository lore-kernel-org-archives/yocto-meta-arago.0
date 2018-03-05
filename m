Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 693F152994
	for <meta-arago@arago-project.org>;
	Mon,  5 Mar 2018 13:24:42 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w25DNw29019393
	for <meta-arago@arago-project.org>; Mon, 5 Mar 2018 07:23:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520256238;
	bh=za2xULCXb7VPmf03ttDPX1I3L7q/WLPINNTJcnUC+Kk=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=j2qmCFkkd2IpDeWKWhZaHUlzBq22wVXhQ6mLtMGcPyZ4LbWWSzARmR3J5pX7/7ivv
	cBcwHrPFTgpy9wu/10vRUlSRRusAbKPgwd3MTRwaShKwS+79lxupPOqmqDoWc22u5B
	dUzf4qLcP+xV2Au5u38j9Xnt3Lr9tOirKz1edWJc=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w25DNwpK032264
	for <meta-arago@arago-project.org>; Mon, 5 Mar 2018 07:23:58 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 5 Mar 2018 07:23:58 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 5 Mar 2018 07:23:58 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w25DNvCd029438;
	Mon, 5 Mar 2018 07:23:57 -0600
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>,
	<meta-arago@arago-project.org>
References: <1520032336-58939-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <2859e3bc-e298-1d32-a12d-f6cd8de7f79f@ti.com>
Date: Mon, 5 Mar 2018 08:23:57 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1520032336-58939-1-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH] transport-rtos: Updating to version 1.0.0.10
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
X-List-Received-Date: Mon, 05 Mar 2018 13:24:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Can you please upstream this directly to meta-ti for morty, rocko, and 
master?


On 3/2/2018 6:12 PM, Mahesh Radhakrishnan wrote:
> ---
>   recipes-bsp/transport-rtos/bmet-eth-rtos_git.bbappend  | 4 ++++
>   recipes-bsp/transport-rtos/nimu-icss-rtos_git.bbappend | 4 ++++
>   recipes-bsp/transport-rtos/nimu-rtos_git.bbappend      | 3 +++
>   recipes-bsp/transport-rtos/transport-1.0.0.10.inc      | 7 +++++++
>   4 files changed, 18 insertions(+)
>   create mode 100644 recipes-bsp/transport-rtos/transport-1.0.0.10.inc
>
> diff --git a/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bbappend b/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bbappend
> index 053fbac..4ae2d0b 100644
> --- a/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bbappend
> +++ b/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bbappend
> @@ -1 +1,5 @@
>   require recipes-bsp/transport-rtos/ndk-path.inc
> +require recipes-bsp/transport-rtos/transport-1.0.0.10.inc
> +
> +LIC_FILES_CHKSUM = "file://bmet_transport.h;beginline=12;endline=40;md5=6d209c698b273aef180b0c1d38469e8e"
> +
> diff --git a/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bbappend b/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bbappend
> index 053fbac..d9db349 100644
> --- a/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bbappend
> +++ b/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bbappend
> @@ -1 +1,5 @@
>   require recipes-bsp/transport-rtos/ndk-path.inc
> +require recipes-bsp/transport-rtos/transport-1.0.0.10.inc
> +
> +LIC_FILES_CHKSUM = "file://nimu_icssEth.h;beginline=1;endline=35;md5=3ea633a510be24d8a89d9d08b930994c"
> +
> diff --git a/recipes-bsp/transport-rtos/nimu-rtos_git.bbappend b/recipes-bsp/transport-rtos/nimu-rtos_git.bbappend
> index 053fbac..691364e 100644
> --- a/recipes-bsp/transport-rtos/nimu-rtos_git.bbappend
> +++ b/recipes-bsp/transport-rtos/nimu-rtos_git.bbappend
> @@ -1 +1,4 @@
>   require recipes-bsp/transport-rtos/ndk-path.inc
> +require recipes-bsp/transport-rtos/transport-1.0.0.10.inc
> +
> +LIC_FILES_CHKSUM = "file://nimu_eth.h;beginline=1;endline=35;md5=ee9c662c39d4584fb2a8b66413d2866d"
> diff --git a/recipes-bsp/transport-rtos/transport-1.0.0.10.inc b/recipes-bsp/transport-rtos/transport-1.0.0.10.inc
> new file mode 100644
> index 0000000..560e96a
> --- /dev/null
> +++ b/recipes-bsp/transport-rtos/transport-1.0.0.10.inc
> @@ -0,0 +1,7 @@
> +require recipes-bsp/transport-rtos/transport.inc
> +
> +# Below commit ID corresponds to "DEV.TRANSPORT.01.00.00.10"
> +TRANSPORT_SRCREV = "d933e59654c1fdfc05b0afa166a4c6670632ae00"
> +
> +PV = "01.00.00.10"
> +INC_PR = "r0"


