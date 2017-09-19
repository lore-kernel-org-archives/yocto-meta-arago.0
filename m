Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id CE502529E4
	for <meta-arago@arago-project.org>;
	Tue, 19 Sep 2017 12:39:30 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8JCdUIg000659
	for <meta-arago@arago-project.org>; Tue, 19 Sep 2017 07:39:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505824770;
	bh=+deS+SQbU3wsNDd2Bte0dfeSFr6mUGlVEHLgMaPe09k=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=Dp3mBnbmc0ctT6fakTK2uNTgl2Gk7JF+PgIwirtPuf62WNV3m62uBP7HBs/9B/GvB
	1rkUnMrZTi2GkoeCJrM8DlPFdixcchjvqj0VJOPs74GnF4Zd/1O6sESYrq5xcgSHvG
	nK8rbFwQs1suZYI8cFM5eZbjBiTpF7X7AEm1RkZc=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8JCdU21017396
	for <meta-arago@arago-project.org>; Tue, 19 Sep 2017 07:39:30 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 19 Sep 2017 07:39:30 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 19 Sep 2017 07:39:30 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8JCdUFO018972;
	Tue, 19 Sep 2017 07:39:30 -0500
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>,
	<meta-arago@arago-project.org>
References: <1505770188-12875-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <ccbb7990-5207-4aa4-8d14-ccfde15b5131@ti.com>
Date: Tue, 19 Sep 2017 08:39:30 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505770188-12875-1-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk PATCH] osal: Updating to version 1.0.0.8
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
X-List-Received-Date: Tue, 19 Sep 2017 12:39:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

These look good. Can you please upstream to corresponding patches to 
meta-ti?


On 9/18/2017 5:29 PM, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>   recipes-bsp/osal/osal-1.0.0.8.inc       | 6 ++++++
>   recipes-bsp/osal/osal-rtos_git.bbappend | 2 ++
>   recipes-bsp/osal/osal-test_git.bbappend | 2 ++
>   recipes-bsp/osal/osal_git.bbappend      | 2 ++
>   4 files changed, 12 insertions(+)
>   create mode 100644 recipes-bsp/osal/osal-1.0.0.8.inc
>   create mode 100644 recipes-bsp/osal/osal-rtos_git.bbappend
>   create mode 100644 recipes-bsp/osal/osal-test_git.bbappend
>   create mode 100644 recipes-bsp/osal/osal_git.bbappend
>
> diff --git a/recipes-bsp/osal/osal-1.0.0.8.inc b/recipes-bsp/osal/osal-1.0.0.8.inc
> new file mode 100644
> index 0000000..b43e43c
> --- /dev/null
> +++ b/recipes-bsp/osal/osal-1.0.0.8.inc
> @@ -0,0 +1,6 @@
> +# Below commit ID corresponding to "DEV.OSAL.01.00.00.08"
> +OSAL_SRCREV = "ebd3acdbb4e7d6d0393efedd15ce479c5a79772d"
> +
> +PV = "01.00.00.08"
> +INC_PR = "r0"
> +
> diff --git a/recipes-bsp/osal/osal-rtos_git.bbappend b/recipes-bsp/osal/osal-rtos_git.bbappend
> new file mode 100644
> index 0000000..e164619
> --- /dev/null
> +++ b/recipes-bsp/osal/osal-rtos_git.bbappend
> @@ -0,0 +1,2 @@
> +require recipes-bsp/osal/osal-1.0.0.8.inc
> +
> diff --git a/recipes-bsp/osal/osal-test_git.bbappend b/recipes-bsp/osal/osal-test_git.bbappend
> new file mode 100644
> index 0000000..e164619
> --- /dev/null
> +++ b/recipes-bsp/osal/osal-test_git.bbappend
> @@ -0,0 +1,2 @@
> +require recipes-bsp/osal/osal-1.0.0.8.inc
> +
> diff --git a/recipes-bsp/osal/osal_git.bbappend b/recipes-bsp/osal/osal_git.bbappend
> new file mode 100644
> index 0000000..e164619
> --- /dev/null
> +++ b/recipes-bsp/osal/osal_git.bbappend
> @@ -0,0 +1,2 @@
> +require recipes-bsp/osal/osal-1.0.0.8.inc
> +


