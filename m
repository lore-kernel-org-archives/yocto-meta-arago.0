Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id B8E0A529AF
	for <meta-arago@arago-project.org>;
	Tue,  5 Sep 2017 12:42:06 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v85Cg6aR022098
	for <meta-arago@arago-project.org>; Tue, 5 Sep 2017 07:42:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504615326;
	bh=f1h2uJYCF52zb+jxwIRyS+eTQ1W6mU+fkf4nOi0WMKo=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=VZ5LvsQ7FOZjWt8MUXbL0/d98dp5zKYMDY4mBREzsypMRgVV6LaN2aDBBYA5gka7k
	IyzawoTI2VJQBmX4h5BWmN6PPZVg/sGM9to20cDNxnOA+xGF8yET+oJozbXNtD1/Ug
	KeZCFUltS1/zIaVdG6klbV+CFKVe7B9xrTIF0XU8=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v85Cg6oD027787
	for <meta-arago@arago-project.org>; Tue, 5 Sep 2017 07:42:06 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 5 Sep 2017 07:42:06 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 5 Sep 2017 07:42:06 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v85Cg5Rv026167;
	Tue, 5 Sep 2017 07:42:06 -0500
To: Manisha Agrawal <manisha.agrawal@ti.com>, <meta-arago@arago-project.org>
References: <20170901211741.26451-1-manisha.agrawal@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <b9508243-1771-913c-c044-98b9eced4913@ti.com>
Date: Tue, 5 Sep 2017 08:42:05 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170901211741.26451-1-manisha.agrawal@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [meta-processor-sdk][PATCH v3 1/7] recipes-apps : add evse-hmi demo
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
X-List-Received-Date: Tue, 05 Sep 2017 12:42:08 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Can you use a commit log similar to what was used for meta-arago?


On 9/1/2017 5:17 PM, Manisha Agrawal wrote:
> Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> ---
>   recipes-apps/evse-hmi/evse-hmi_git.bb | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
>   create mode 100755 recipes-apps/evse-hmi/evse-hmi_git.bb
>
> diff --git a/recipes-apps/evse-hmi/evse-hmi_git.bb b/recipes-apps/evse-hmi/evse-hmi_git.bb
> new file mode 100755
> index 0000000..abd4e90
> --- /dev/null
> +++ b/recipes-apps/evse-hmi/evse-hmi_git.bb
> @@ -0,0 +1,23 @@
> +SUMMARY = "HMI demo for electronic vehicle charging station (EVSE) using QT QWidget tools"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://main.cpp;beginline=1;endline=33;md5=a9cde3921a8be42ed79ab74661799104"
> +
> +inherit qt-provider
> +
> +PV = "1.0"
> +PR = "r0"
> +
> +BRANCH = "master"
> +SRC_URI = "git://git.ti.com/sitara-linux/evse-hmi.git;protocol=git;branch=${BRANCH}"
> +
> +SRCREV = "a257dfc05db311c74cb50838ff5b9e2cfb87dbfe"
> +
> +S = "${WORKDIR}/git"
> +
> +CREATE_SRCIPK_evse-hmi = "1"
> +SRCIPK_INSTALL_DIR_evse-hmi = "example-applications/${PN}-${PV}"

You do not need variable overrides here as you are configuring this 
within the recipe.

You can use 'CREATE_SRCIPK = "1"', and 'SRCIPK_INSTALL_DIR = ...'

> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 755 evse_hmi ${D}${bindir}
> +}


