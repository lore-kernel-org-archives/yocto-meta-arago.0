Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C4C5C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 18:24:36 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.1005.1650997466155377262
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 11:24:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=e334PZUK;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23QIOLYA112441;
	Tue, 26 Apr 2022 13:24:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1650997461;
	bh=6vFEn1mAvJKXcvk7Atfw1PZxkObc5STdCBL8m9QmVeU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=e334PZUKjSgzjQ6QKjk+RRj+vlRMibVMHUk+kbrKv1YlUnZGnETrKB6lOCegT6MFN
	 TcheCjmKZzvL+7phGlF/EQW/mCQbsz3fKHsIFYNv7ofdTO5vWjt4XUWGsTmWvthvKd
	 RNDaM+hbcMlzd2RrzohISQUr8XmOSRWneY3dn7Zc=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23QIOLxw101989
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 26 Apr 2022 13:24:21 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Apr 2022 13:24:21 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Apr 2022 13:24:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23QIOLDx022210;
	Tue, 26 Apr 2022 13:24:21 -0500
Date: Tue, 26 Apr 2022 13:24:21 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <a0393906@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][dunfell][PATCH] statcol: Update to latest for VTM
 driver scripts
Message-ID: <20220426182421.5hwleqmqe57j7peb@neatly>
References: <20220422164104.20009-1-a0393906@ti.com>
 <20220426160315.GA9834@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220426160315.GA9834@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 26 Apr 2022 18:24:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13791

On 12:03-20220426, Denys Dmytriyenko wrote:
> On Fri, Apr 22, 2022 at 10:11:04PM +0530, Karthik Ramanan via lists.yoctoproject.org wrote:

We probably should indicate some sort of change log to indicate why the
switch?

> > Signed-off-by: Karthik Ramanan <a0393906@ti.com>

Also please fix the mail ID.

> > ---
> >  meta-arago-extras/recipes-devtools/statcol/statcol.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta-arago-extras/recipes-devtools/statcol/statcol.bb b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
> > index ee2b12d2..bda532eb 100644
> > --- a/meta-arago-extras/recipes-devtools/statcol/statcol.bb
> > +++ b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
> > @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bb6bc27cd44417c389a180bd62f552a0"
> >  
> >  PROTOCOL = "git"
> >  BRANCH = "master"
> > -SRCREV = "dd0131eadf3633e8f9d06cb390d3c6c1b074d873"
> > +SRCREV = "2dac74a233dd489d9bb48a50153c4a1360361b62"
> >  SRC_URI = "git://git.ti.com/glsdk/statcol.git;protocol=${PROTOCOL};branch=${BRANCH}"
> >  
> >  DEPENDS = "ti-rpmsg-char websocketd"
> > @@ -19,6 +19,6 @@ do_install() {
> >  	DESTDIR=${D} make install
> >  }
> >  
> > -PR:append = "_3"
> > +PR:append = "_4"
> 
> Again, the patch doesn't seem to be against dunfell, but is against master 
> instead, unlike what the subject says.
> 
> 
> >  INSANE_SKIP:${PN} = "ldflags"
> > -- 
> > 2.17.1
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#13790): https://lists.yoctoproject.org/g/meta-arago/message/13790
> Mute This Topic: https://lists.yoctoproject.org/mt/90709684/5513541
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [nm@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

