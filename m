Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 7CEB352A67
	for <meta-arago@arago-project.org>;
	Fri, 22 Sep 2017 18:35:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8MIZ8sK024816
	for <meta-arago@arago-project.org>; Fri, 22 Sep 2017 13:35:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506105308;
	bh=WW6CjZOKeTMdObIovTKMYHK4PT1WejmGW8PDMGI6M6o=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=AAt6CfrWiAJjXb1eybCuofPGVopEzN0n6A+a48iTpqeor1r3Ok/d0YtXT8CGekiBi
	qkNZOe5EnqB2CRQWsj3WoPuKT1IDxj+JboX7AAGEGmF10iT9XHZ1YNN39GV+UPQmZD
	LwJwgFQK1hfWR/esb3T0Zxy6omdhAtXGGVSg967s=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8MIZ36X005563
	for <meta-arago@arago-project.org>; Fri, 22 Sep 2017 13:35:03 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 22 Sep 2017 13:35:03 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 22 Sep 2017 13:35:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8MIZ3Y4029438;
	Fri, 22 Sep 2017 13:35:03 -0500
Date: Fri, 22 Sep 2017 14:34:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Agrawal, Manisha" <manisha.agrawal@ti.com>
Message-ID: <20170922183447.GP26843@edge>
References: <20170901205107.25462-1-manisha.agrawal@ti.com>
	<20170901205107.25462-2-manisha.agrawal@ti.com>
	<20170912022548.GT8304@edge>
	<3AC2660648D2B04999D9C7562469E8AF7EC55BC3@DFLE12.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <3AC2660648D2B04999D9C7562469E8AF7EC55BC3@DFLE12.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [morty][PATCH v1 2/6] matrix-gui-apps-git : update SRCREV version
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
X-List-Received-Date: Fri, 22 Sep 2017 18:35:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Manisha,

All evse-hmi patches were merged to morty branch. See this changelog on 
2017-08-31 between ti2017.04-rc1 and ti2017.04-rc2 tags:

http://arago-project.org/git/?p=meta-arago.git;a=shortlog;h=refs/heads/morty

-- 
Denys


On Fri, Sep 22, 2017 at 02:25:06PM -0400, Agrawal, Manisha wrote:
> Hi Denys,
> 
> Which meta-arago branch is attached patch series applied to? My patch series 
> below are on top of attached one. I tried to update my local repo with below 
> instruction but I do not see evse-hmi under meta-arago-extras/recipe-apps/
> #./oe-layertool-setup.sh  -f configs/arago-morty-config.txt
> 
> 
> Regards,
> Manisha
> 
> 
> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Monday, September 11, 2017 9:26 PM
> To: Agrawal, Manisha
> Cc: meta-arago@arago-project.org; Stiffler, Jacob
> Subject: Re: [meta-arago][morty][PATCH v1 2/6] matrix-gui-apps-git : update SRCREV version
> 
> On Fri, Sep 01, 2017 at 03:51:03PM -0500, Manisha Agrawal wrote:
> > Add new demo pretection-relays-hmi in hmi_apps.
> 
> "pretection"
> 
> 
> > Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> > ---
> >  meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> > index 551416d9..1b20f919 100644
> > --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> > +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> > @@ -4,7 +4,7 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
> >  LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
> >  
> >  SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
> > -SRCREV = "50a2f2ec7043e17bc7af72186e3d0a8d7773ec0a"
> > +SRCREV = "094736065e1a15a49da19ef4c5a100aa763c41d1"
> >  BRANCH = "master"
> >  INC_PR = "r48"
> >  
> > -- 
> > 2.13.0
> > 

Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE72.ent.ti.com
 (128.247.5.109) with Microsoft SMTP Server (TLS) id 14.3.294.0; Thu, 31 Aug
 2017 14:02:48 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34; Thu, 31
 Aug 2017 14:02:48 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend Transport;
 Thu, 31 Aug 2017 14:02:48 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
 dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7VJ2mQf010131;	Thu, 31 Aug
 2017 14:02:48 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "Agrawal, Manisha" <manisha.agrawal@ti.com>
CC: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Stiffler,
 Jacob" <j-stiffler@ti.com>
Subject: Re: [meta-arago][morty][PATCH v3 1/7] evse-hmi : add new demo
Thread-Topic: [meta-arago][morty][PATCH v3 1/7] evse-hmi : add new demo
Thread-Index: AQHTIblaDylsZV2NCUSDbzHOnlsw4aKfJ9IA
Date: Thu, 31 Aug 2017 15:02:44 -0400
Message-ID: <20170831190244.GB8304@edge>
References: <20170830175647.11427-1-manisha.agrawal@ti.com>
In-Reply-To: <20170830175647.11427-1-manisha.agrawal@ti.com>
Content-Language: en-US
X-MS-Exchange-Organization-AuthMechanism: 10
X-MS-Exchange-Organization-AuthSource: DFLE107.ent.ti.com
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset="us-ascii"
Content-ID: <67368E74756CB6439B51C29CF3D1000A@owa.mail.ti.com>
MIME-Version: 1.0
> 
> Thanks. The entire series now looks good. Though your separate patch for
> tisdk-rootfs-image should have been part of this series as well, somewhere
> between patch #6 and #7...
> 
> --
> Denys
> 
> 
> On Wed, Aug 30, 2017 at 12:56:41PM -0500, Manisha Agrawal wrote:
> > EVSE stands for electronic vehicle supply station.  This demo is created as part
> > of TID on EVSE to demonsrate drawing the gui for EVSE application using QT
> > QWidget and rendering on LCD panel using  linuxfb QPA.
> >
> > Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> > ---
> >  .../recipes-apps/evse-hmi/evse-hmi_git.bb            | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >  create mode 100755 meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb
> >
> > diff --git a/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb b/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb
> > new file mode 100755
> > index 00000000..27a58a96
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb
> > @@ -0,0 +1,20 @@
> > +SUMMARY = "HMI demo for electronic vehicle charging station (EVSE) using QT QWidget tools"
> > +LICENSE = "BSD-3-Clause"
> > +LIC_FILES_CHKSUM = "file://main.cpp;beginline=1;endline=33;md5=a9cde3921a8be42ed79ab74661799104"
> > +
> > +inherit qt-provider
> > +
> > +PV = "1.0"
> > +PR = "r0"
> > +
> > +BRANCH = "master"
> > +SRC_URI = "git://git.ti.com/sitara-linux/evse-hmi.git;protocol=git;branch=${BRANCH}"
> > +
> > +SRCREV = "a257dfc05db311c74cb50838ff5b9e2cfb87dbfe"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +do_install() {
> > +    install -d ${D}${bindir}
> > +    install -m 755 evse_hmi ${D}${bindir}
> > +}
> > --
> > 2.13.0
> >


