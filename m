Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 69944529B5
	for <meta-arago@arago-project.org>;
	Tue, 16 Jun 2015 14:33:41 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t5GEXdVU002001;
	Tue, 16 Jun 2015 09:33:39 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t5GEXduq003065;
	Tue, 16 Jun 2015 09:33:39 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 16 Jun 2015 09:33:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t5GEXdNC003292;
	Tue, 16 Jun 2015 09:33:39 -0500
Date: Tue, 16 Jun 2015 10:33:38 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: matti kaasinen <matti.kaasinen@gmail.com>
Message-ID: <20150616143338.GB14786@edge>
References: <CADnUhn3FrWPH_yUKzX-Tf9Q9vz5GYmDHrVTOQxk_CefMgKvT1A@mail.gmail.com>
	<CADnUhn1obcbd+OwzAYhDVQzU8eGMh_wt7JapOZH1agPBfFpyaQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADnUhn1obcbd+OwzAYhDVQzU8eGMh_wt7JapOZH1agPBfFpyaQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: overriding arago.conf settings
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
X-List-Received-Date: Tue, 16 Jun 2015 14:33:41 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jun 16, 2015 at 02:24:20PM +0300, matti kaasinen wrote:
> I found how to do it in layer.conf:
> PREFERRED_VERSION_u-boot_forcevariable                = "2013.10"
> PREFERRED_VERSION_u-boot-ti-staging_forcevariable     = "2013.10%"

Correct. Not sure why would you prefer older u-boot, but still. Also, maybe 
local.conf is a better place to do that, but it will work anyway.


> 2015-06-16 12:08 GMT+03:00 matti kaasinen <matti.kaasinen@gmail.com>:
> 
> > Hi!
> > Do anyone know how to overriding variables set in arago.conf using
> > layer.conf or local.conf settings (or anything else that touching Arago
> > layer). I try to set something else on my own layer
> > (PREFERRED_VERSION_u-boot). I have tried changing layer orders in
> > bblayers.conf and priority in layer.conf. In fact if I got it right from
> > Yocto documentation distro.conf is just parsed first and that is what rules.
> > Thanks,
> > Matti
> >

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


