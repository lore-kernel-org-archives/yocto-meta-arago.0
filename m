Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id B212252AC0
	for <meta-arago@arago-project.org>;
	Tue, 29 Aug 2017 17:11:50 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7THBoOB013003
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 12:11:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504026710;
	bh=Wfn9gLCtOWT4BtUuYLNdIOP8F0sN0fISaTC7OUfOFyk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=AqO+y+Br279n3PiKox4dGTjWizyyvHYIhVfOSFjYiyVdpl+nAKt6NxU9v029bov4x
	Hl/YS1RmNaBcv0J4bgy109vqF7z5QJoOmErdfXrokEtzEXAxHrKCDMT96nxUH90Id4
	/AI3ZoFoVC+chsS7U8XFeICfOKXpgmO1vnqUF+24=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7THBoif018206
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 12:11:50 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 29 Aug 2017 12:11:50 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 29 Aug 2017 12:11:50 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7THBoR2022326;
	Tue, 29 Aug 2017 12:11:50 -0500
Date: Tue, 29 Aug 2017 13:11:45 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Manisha Agrawal <manisha.agrawal@ti.com>
Message-ID: <20170829171145.GD8304@edge>
References: <20170829163826.15777-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
In-Reply-To: <20170829163826.15777-1-manisha.agrawal@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [morty][PATCH v2 1/6] meta-arago-extras : recipe-apps : evse-hmi : new demo
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
X-List-Received-Date: Tue, 29 Aug 2017 17:11:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Manisha,

https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Headers_and_Commit_Messages

Change Subject from:

> meta-arago-extras : recipe-apps : evse-hmi : new demo

To:

> evse-hmi: add new demo


> Recipe to build EVSE HMI demo.

Please drop this sentence ^^^


> EVSE stands for electronic vehicle
> supply station.  This demo is created as part of TID on EVSE to
> demonsrate drawing the gui for EVSE application using QT QWidget and
> rendering on LCD panel using  linuxfb QPA.
> 
> Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> ---
>  .../recipes-apps/evse-hmi/evse-hmi_git.bb            | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100755 meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb
> 
> diff --git a/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb b/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb
> new file mode 100755
> index 0000000..4c7c8c6
> --- /dev/null
> +++ b/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb
> @@ -0,0 +1,20 @@
> +DESCRIPTION = "HMI demo for electronic vehicle charging station (EVSE) using QT QWidget tools"

SUMMARY is missing:
https://lists.yoctoproject.org/pipermail/meta-ti/2017-July/010261.html


> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://main.cpp;beginline=1;endline=33;md5=a9cde3921a8be42ed79ab74661799104"
> +
> +inherit qt-provider
> +
> +PV = "01.00.00"
> +PR = "r1"
> +
> +BRANCH = "master"
> +SRC_URI = "git://git.ti.com/sitara-linux/evse-hmi.git;protocol=git;branch=${BRANCH}"
> +
> +SRCREV = "a257dfc05db311c74cb50838ff5b9e2cfb87dbfe"
> +
> +S = "${WORKDIR}/git"
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 755 evse_hmi ${D}${bindir}
> +}
> -- 
> 2.13.0
> 

