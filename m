Return-Path: <Sivaprasad.Pala@in.bosch.com>
Received: from smtp6-v.fe.bosch.de (smtp6-v.fe.bosch.de [139.15.237.11])
	by arago-project.org (Postfix) with ESMTPS id 8B65052998
	for <meta-arago@arago-project.org>;
	Thu,  1 Aug 2013 08:47:30 +0000 (UTC)
Received: from vsmta12.fe.internet.bosch.com (unknown [10.4.98.52])
	by imta23.fe.bosch.de (Postfix) with ESMTP id A748F158020C;
	Thu,  1 Aug 2013 10:47:28 +0200 (CEST)
Received: from localhost (vsgw4.fe.internet.bosch.com [10.4.98.12])
	by vsmta12.fe.internet.bosch.com (Postfix) with SMTP id 8931D1B8044A;
	Thu,  1 Aug 2013 10:47:28 +0200 (CEST)
Received: from SI-PUB1000.de.bosch.com (10.3.153.157) by si-hub06.de.bosch.com
	(10.3.153.48) with Microsoft SMTP Server (TLS) id 8.3.298.1;
	Thu, 1 Aug 2013 10:47:19 +0200
Received: from sgphub13.APAC.bosch.com (10.187.48.75) by
	SI-PUB1000.de.bosch.com (10.3.153.157) with Microsoft SMTP Server (TLS)
	id 14.3.146.0; Thu, 1 Aug 2013 10:47:19 +0200
Received: from SGPMBX02.APAC.bosch.com ([10.187.64.46]) by
	sgphub13.APAC.bosch.com ([10.187.48.75]) with mapi;
	Thu, 1 Aug 2013 16:47:04 +0800
From: "Sivaprasad Pala (RBEI/EAA1)" <Sivaprasad.Pala@in.bosch.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] error while building yocto for am335x
Thread-Index: AQHOjnmXKMLUgXQ1lUSvB3jFWWWAr5l//48AgAAFFVA=
Message-ID: <F2E05BCE6D875B4AAC726FD84CBB8F1322266D84DE@SGPMBX02.APAC.bosch.com>
References: <1366828154-17755-1-git-send-email-hzhang@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C4328F5@DFLE08.ent.ti.com>
	<ECA334CFBA16F74DB2C66A2F1181F4D63C2B1F41@DLEE09.ent.ti.com>
	<20130424194115.GR12173@edge> <loom.20130801T071150-638@post.gmane.org>
	<7D46E86EC0A8354091174257B2FED101596876B2@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED101596876B2@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 19 Aug 2013 17:26:46 +0000
Subject: Re: error while building yocto for am335x
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
Date: Thu, 01 Aug 2013 08:47:31 -0000
X-Original-Date: Thu, 1 Aug 2013 16:47:00 +0800
X-List-Received-Date: Thu, 01 Aug 2013 08:47:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

latest commit id I took from site and replaced SRCREV with latest one.
Even I am getting the error "Failure expanding variable S:"
And "SRCPV, expression was ${@bb.fetch2.get_srcrev(d)}"

And,

I am trying to setup "git proxy settings".
Under corporate firewall I am unable to use command "git clone git://git.ke=
rnel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git"
What configurations should I need to do for using "git://git.kernel.org"

Thanks for the reply.

Regards,
Siva.


-----Original Message-----
From: Maupin, Chase [mailto:chase.maupin@ti.com]=20
Sent: Thursday, August 01, 2013 1:39 PM
To: Sivaprasad Pala (RBEI/EAA1); meta-arago@arago-project.org
Subject: RE: [meta-arago] error while building yocto for am335x

Ltp-ddt is an autorev recipe which means that it must read the current late=
st commit id in order to parse.  This looks like you are having an issue wi=
th git reaching the repository. Can you check your git proxy settings?

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of siva
>Sent: Thursday, August 01, 2013 11:04 AM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] error while building yocto for am335x
>
>hello all,
>
>I followed steps mentioned in below wiki.
>http://arago-
>project.org/wiki/index.php/Setting_Up_Build_Environment
>
>I am wandering why the build is going to fail.
>I tried in many ways to resolve it.(changing the definition of
>variable etc.)
>
>Please find the below log.
>
>Thanks,
>Siva.
>
>
>xxxxx@xxxxx:~/tisdk/build$ MACHINE=3Dam335x-evm bitbake core-image-
>minimal
>Pseudo is not present but is required, building this first before
>the main build
>Loading cache: 100%
>|#################################################################
>#############
>######################################################|
>ETA:  00:00:00
>Loaded 72 entries from dependency cache.
>NOTE: Error during finalise of/home/xxxxx/tisdk/sources/meta-
>arago/
>meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bb--
>:--
>
>ERROR: ExpansionError during
>parsing/home/xxxxx/tisdk/sources/meta-arago/
>meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bb:
>
>Failure expanding variable S: ExpansionError: Failure expanding
>variable
>SRCPV, expression was ${@bb.fetch2.get_srcrev(d)} which triggered
>exception
>FetchError: Fetcher failure: Fetch command failed with exit code
>128, output:
>fatal: unable to connect to arago-project.org:
>arago-project.org: Name or service not known
>
>
>ERROR: Command execution failed: Exited with 1
>
>Summary: There were 2 ERROR messages shown,
>returning a non-zero exit code.
>xxxxx@xxxxx:~/tisdk/build$
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

