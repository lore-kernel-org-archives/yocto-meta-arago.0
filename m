Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 5E2015209B
	for <meta-arago@arago-project.org>;
	Thu, 14 Dec 2017 14:34:41 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBEEYepf019185
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 08:34:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513262080;
	bh=hM2sXg6wbYc5R5EjQ3tLbOeZ5jv+oEWjq9tHWqUTcBE=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=xFdUHeGO94UkyCMOQ78J4GwCGgeaSfBirREKcToQukh+WU6RgsfsFzVh9Ft6HQBC3
	7OboUf4ios6SUz8Y84a5Gf0p8n4EXqgCf0HWQEhzX2YsUi4p/Qw+aGNQu7dPnOJ6ag
	QkjHt1l+4TB4HYqzhElhUyTgE4uZxZAD4mj+922E=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBEEYehv022340
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 08:34:40 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 14 Dec 2017 08:34:40 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 14 Dec 2017 08:34:40 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBEEYeqw014251;
	Thu, 14 Dec 2017 08:34:40 -0600
To: Mahesh Radhakrsihnan <m-radhakrishnan2@ti.com>,
	<meta-arago@arago-project.org>
References: <1513203442-24103-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <6869b0ab-03dd-a22a-ab96-0e6434c03e64@ti.com>
Date: Thu, 14 Dec 2017 09:34:39 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1513203442-24103-1-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH v2 ] uart-lld-rtos: Updating to version 1.0.0.9
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
X-List-Received-Date: Thu, 14 Dec 2017 14:34:41 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Please fixup the v1 with this change.


On 12/13/2017 5:17 PM, Mahesh Radhakrsihnan wrote:
> From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
>
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>   v2 - Renaming the extension of the file to bbappend
>   v1 - Initial draft
>
>   recipes-bsp/uart-lld/{uart-lld-rtos_git.bb => uart-lld-rtos_git.bbappend} | 0
>   1 file changed, 0 insertions(+), 0 deletions(-)
>   rename recipes-bsp/uart-lld/{uart-lld-rtos_git.bb => uart-lld-rtos_git.bbappend} (100%)
>
> diff --git a/recipes-bsp/uart-lld/uart-lld-rtos_git.bb b/recipes-bsp/uart-lld/uart-lld-rtos_git.bbappend
> similarity index 100%
> rename from recipes-bsp/uart-lld/uart-lld-rtos_git.bb
> rename to recipes-bsp/uart-lld/uart-lld-rtos_git.bbappend


