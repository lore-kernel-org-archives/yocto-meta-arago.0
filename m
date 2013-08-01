Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id C23FF529C9
	for <meta-arago@arago-project.org>;
	Thu,  1 Aug 2013 08:09:04 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r71891Xp029817;
	Thu, 1 Aug 2013 03:09:01 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r71891EZ009098;
	Thu, 1 Aug 2013 03:09:01 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Thu, 1 Aug 2013 03:09:01 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: siva <sivaprasad.pala@in.bosch.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] error while building yocto for am335x
Thread-Index: AQHOjnmXKMLUgXQ1lUSvB3jFWWWAr5l//48A
Date: Thu, 1 Aug 2013 08:09:01 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101596876B2@DLEE11.ent.ti.com>
References: <1366828154-17755-1-git-send-email-hzhang@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C4328F5@DFLE08.ent.ti.com>
	<ECA334CFBA16F74DB2C66A2F1181F4D63C2B1F41@DLEE09.ent.ti.com>
	<20130424194115.GR12173@edge> <loom.20130801T071150-638@post.gmane.org>
In-Reply-To: <loom.20130801T071150-638@post.gmane.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 01 Aug 2013 08:09:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

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

