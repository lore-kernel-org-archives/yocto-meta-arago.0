Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 743E85299A
	for <meta-arago@arago-project.org>;
	Mon, 10 Jun 2019 22:21:10 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5AMKVrF055519;
	Mon, 10 Jun 2019 17:20:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560205231;
	bh=mJ4ImxTQ7XppxY8HlLuJSTccHUDS6eLylFcimFOFL2k=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=j6Xr51JGW93scqZrLsoAHNMcSv9AgMfjJUFSHk1/WhS/uoc49T6LATQgIYzmOlP1E
	D58nZu1g2JRb9qMXs5xuCifF4Eucj4OJ7oPptiGwXEUZsV7ickJKTynwBwtGHU4lX7
	VrDi3NF93CZgEA5V9ZG9pqqYsij4DdbhXVSSFwnE=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5AMKV7L042589
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Jun 2019 17:20:31 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 10 Jun 2019 17:20:31 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 10 Jun 2019 17:20:31 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5AMKUnD076153;
	Mon, 10 Jun 2019 17:20:30 -0500
Date: Mon, 10 Jun 2019 18:20:30 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Message-ID: <20190610222030.GK25589@beryl>
References: <CADySD0Fv+OXf_73cMBEWSr2N0pF4wB=NGESN3987kQ8tLfEUDw@mail.gmail.com>
	<20190610171512.GE25589@beryl>
	<CADySD0GL-ndHy_g8zesfpyW-LagiyFn1-zv88g-sdWmPU6bFGg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADySD0GL-ndHy_g8zesfpyW-LagiyFn1-zv88g-sdWmPU6bFGg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: Upcoming stable branch
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
X-List-Received-Date: Mon, 10 Jun 2019 22:21:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

No, <release>-next branches are used across many OpenEmbedded/Yocto layers 
exactly the same - for testing changes to that release branch.

Denys


On Tue, Jun 11, 2019 at 08:15:41AM +1200, Ankur Tyagi wrote:
> Thanks Denys.
> 
> Should I start with thud or thud-next?
> Is thud-next for next milestone release?.
> 
> Regards
> Ankur
> 
> On Tue, 11 Jun 2019, 5:15 a.m. Denys Dmytriyenko, <denys@ti.com> wrote:
> 
> > No plans for warrior - we are on a single LTS per year schedule, picking
> > up
> > only Fall even releases and skipping Spring odd ones.
> >
> > Denys
> >
> >
> > On Mon, Jun 10, 2019 at 08:14:21AM +1200, Ankur Tyagi wrote:
> > > Hi,
> > >
> > > We are planning to upgrade arago distro in our product.
> > > At this point, I can only see thud branch in meta-arago whereas warrior
> > is
> > > available in oe-core.
> > >
> > > Is there any plan for warrior in meta-arago or is it being skipped?
> > > What is the difference between thud and thud-next?
> > >
> > > Thanks
> > > Ankur
> >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >
> >

