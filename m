Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 23026529AF
	for <meta-arago@arago-project.org>;
	Tue,  5 Sep 2017 17:30:05 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v85HU4cN017438
	for <meta-arago@arago-project.org>; Tue, 5 Sep 2017 12:30:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504632605;
	bh=Wgi5bzrQNznGokmuEcJ0rQzszAKFEQTufZgc2G+trR8=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=fXxXY3EsF0XjbJlN3itvf6JPB79GHp9azgv9iwyqpQz4vBvSS8hrQ1EfknNAdeJMR
	w53K2P/aWGlRypPEsM2+3KoI7W/LtnUQl7orJaKpf6fDpN00Esgf2vlSQxooDBPJMh
	mlo8RUriDwxj7gOj79R/8y+kAE/q+CU/QDFthcCY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v85HU3tG003922
	for <meta-arago@arago-project.org>; Tue, 5 Sep 2017 12:30:04 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 5 Sep 2017 12:30:04 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 5 Sep 2017 12:30:04 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v85HU4Nw026403;
	Tue, 5 Sep 2017 12:30:04 -0500
To: Manisha Agrawal <manisha.agrawal@ti.com>, <meta-arago@arago-project.org>
References: <20170905170926.13566-1-manisha.agrawal@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <81a1242d-97b4-dab8-ff7c-2af846bade5c@ti.com>
Date: Tue, 5 Sep 2017 13:30:04 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170905170926.13566-1-manisha.agrawal@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [meta-processor-sdk][PATCH v4 1/8] recipes-apps : add evse-hmi demo
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
X-List-Received-Date: Tue, 05 Sep 2017 17:30:05 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Thanks. This set has been pushed.


On 9/5/2017 1:09 PM, Manisha Agrawal wrote:
> EVSE stands for Electronic Vehicle Supply Station.  This demo is created as part
> of TID on EVSE to demonsrate drawing the gui for EVSE application using QT
> QWidget and rendering on LCD panel using  linuxfb QPA.
>
> Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> ---
>   recipes-apps/evse-hmi/evse-hmi_git.bb | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
>   create mode 100755 recipes-apps/evse-hmi/evse-hmi_git.bb
>
> diff --git a/recipes-apps/evse-hmi/evse-hmi_git.bb b/recipes-apps/evse-hmi/evse-hmi_git.bb
> new file mode 100755
> index 0000000..1bb66f5
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
> +CREATE_SRCIPK = "1"
> +SRCIPK_INSTALL_DIR = "example-applications/${PN}-${PV}"
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 755 evse_hmi ${D}${bindir}
> +}


