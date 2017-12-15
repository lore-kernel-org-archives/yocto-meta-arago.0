Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id A3ACE529ED
	for <meta-arago@arago-project.org>;
	Fri, 15 Dec 2017 14:40:17 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBFEe59S028869
	for <meta-arago@arago-project.org>; Fri, 15 Dec 2017 08:40:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513348805;
	bh=1Qd0JG84pJc9shnf5dJP/awaYrHNN6/H1NZMaAWer3A=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=mxVw0xx9KS+d9EkXMzak6aEIEecknZHMv26h9dOLB3VoB9eTYAmBK+/jPqE7MtB5q
	YOgQ/dFESi55PvQqiQ0anAVhCp/GmjWYv05/n6wQgljiD5IJPYeKDkq691V20rc1jv
	YakbdwEaI1IvM+QconmsGBh817FSpGTyng2t5Pjk=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBFEe0b0004270
	for <meta-arago@arago-project.org>; Fri, 15 Dec 2017 08:40:00 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 15 Dec 2017 08:40:00 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 15 Dec 2017 08:40:00 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBFEdx5b009891;
	Fri, 15 Dec 2017 08:40:00 -0600
To: Mahesh Radhakrsihnan <m-radhakrishnan2@ti.com>,
	<meta-arago@arago-project.org>
References: <1513287736-52378-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <08a2fb69-109f-7aec-d9b4-1cce86a22c72@ti.com>
Date: Fri, 15 Dec 2017 09:39:59 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1513287736-52378-1-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH v2] transport-rtos: Update to version 1.0.0.9
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
X-List-Received-Date: Fri, 15 Dec 2017 14:40:20 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

nimu-rtos and nimu-icss-rtos fail to build.

It appears that NDK_INSTALL_DIR is not defined.


On 12/14/2017 4:42 PM, Mahesh Radhakrsihnan wrote:
> From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
>
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>
>   v2 - Adding rtos dependencies for omap & c66x for nimu-icss-rtos
>   v1 - Update the srcrev
>
>   recipes-bsp/transport-rtos/bmet-eth-rtos_git.bbappend  | 1 +
>   recipes-bsp/transport-rtos/nimu-icss-rtos_git.bbappend | 5 +++++
>   recipes-bsp/transport-rtos/nimu-rtos_git.bbappend      | 1 +
>   recipes-bsp/transport-rtos/transport-1.0.0.9.inc       | 5 +++++
>   4 files changed, 12 insertions(+)
>   create mode 100644 recipes-bsp/transport-rtos/bmet-eth-rtos_git.bbappend
>   create mode 100644 recipes-bsp/transport-rtos/nimu-icss-rtos_git.bbappend
>   create mode 100644 recipes-bsp/transport-rtos/nimu-rtos_git.bbappend
>   create mode 100644 recipes-bsp/transport-rtos/transport-1.0.0.9.inc
>
> diff --git a/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bbappend b/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bbappend
> new file mode 100644
> index 0000000..d51f113
> --- /dev/null
> +++ b/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bbappend
> @@ -0,0 +1 @@
> +require recipes-bsp/transport-rtos/transport-1.0.0.9.inc
> diff --git a/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bbappend b/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bbappend
> new file mode 100644
> index 0000000..3f4bd16
> --- /dev/null
> +++ b/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bbappend
> @@ -0,0 +1,5 @@
> +require recipes-bsp/transport-rtos/transport-1.0.0.9.inc
> +
> +DEPENDS_append_c665x-evm = " emac-lld-rtos"
> +DEPENDS_append_c667x-evm = " pa-lld-rtos"
> +DEPENDS_append_omapl1 = " emac-lld-rtos"
> diff --git a/recipes-bsp/transport-rtos/nimu-rtos_git.bbappend b/recipes-bsp/transport-rtos/nimu-rtos_git.bbappend
> new file mode 100644
> index 0000000..d51f113
> --- /dev/null
> +++ b/recipes-bsp/transport-rtos/nimu-rtos_git.bbappend
> @@ -0,0 +1 @@
> +require recipes-bsp/transport-rtos/transport-1.0.0.9.inc
> diff --git a/recipes-bsp/transport-rtos/transport-1.0.0.9.inc b/recipes-bsp/transport-rtos/transport-1.0.0.9.inc
> new file mode 100644
> index 0000000..f150e41
> --- /dev/null
> +++ b/recipes-bsp/transport-rtos/transport-1.0.0.9.inc
> @@ -0,0 +1,5 @@
> +# Below commit ID corresponds to "DEV.TRANSPORT.01.00.00.09"
> +TRANSPORT_SRCREV = "7b69e1d6d189c579e2a27b955891f9f268fd0e98"
> +
> +PV = "01.00.00.09"
> +INC_PR = "r0"


