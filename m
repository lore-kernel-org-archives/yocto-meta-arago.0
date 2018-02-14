Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 63219529AB
	for <meta-arago@arago-project.org>;
	Wed, 14 Feb 2018 14:57:01 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w1EEuifr007538;
	Wed, 14 Feb 2018 08:56:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1518620204;
	bh=62fRuZEBFsvIlXtBdjtrZbnzeonOw81+RdmZqG1Yz4U=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=r5DGRCJz3zPDGCNa6nOux5lq/8QEf7OlcCUUW+Q+gmhrULCEoS063y9QZ0puY3/jy
	lNCNxj3nDnzda8RIUyYPlXZV5U9fW/vas18IrbpbDBkutqPbzmYzp3RMbBnByhsmZR
	H8JxGTCLW324ygn57nVd7Gxfpo4bGldO9sAwFJkU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1EEuib5015341;
	Wed, 14 Feb 2018 08:56:44 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 14 Feb 2018 08:56:43 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 14 Feb 2018 08:56:44 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1EEuhRL018252;
	Wed, 14 Feb 2018 08:56:43 -0600
Date: Wed, 14 Feb 2018 09:56:42 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Adam Lee <adam.yh.lee@gmail.com>
Message-ID: <20180214145642.GN31854@edge>
References: <CAFeBWL525C75dwezNganhmoQ2gTRQ-ppbUcxT3r5MJCBwHWVQQ@mail.gmail.com>
	<20180214144625.GL31854@edge>
	<CAFeBWL4ABx1nuuQdexo5w8CV7sxL7T_Snzh_4+jKaZ=nv=O54w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFeBWL4ABx1nuuQdexo5w8CV7sxL7T_Snzh_4+jKaZ=nv=O54w@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: Gforge dicommissioned
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
X-List-Received-Date: Wed, 14 Feb 2018 14:57:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Feb 14, 2018 at 02:47:22PM +0000, Adam Lee wrote:
> Appreciate prompt response.
> Is there a work-around on this yet?

We are setting up a mirror, please stay tuned for an official message.


> On Wed, Feb 14, 2018 at 9:46 AM Denys Dmytriyenko <denys@ti.com> wrote:
> 
> > On Wed, Feb 14, 2018 at 02:45:27PM +0000, Adam Lee wrote:
> > > It looks like gforge.ti.com has been decommissioned.
> > > I am getting fetch failures and there are no working mirrors.
> >
> > Yes, we know.
> >
> > --
> > Denys
> >

