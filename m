Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 530B7529B5
	for <meta-arago@arago-project.org>;
	Tue, 16 Jun 2015 14:32:23 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t5GEWLVW018648;
	Tue, 16 Jun 2015 09:32:21 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t5GEWLw5001918;
	Tue, 16 Jun 2015 09:32:21 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 16 Jun 2015 09:32:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t5GEWK8C019131;
	Tue, 16 Jun 2015 09:32:21 -0500
Date: Tue, 16 Jun 2015 10:32:20 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: matti kaasinen <matti.kaasinen@gmail.com>
Message-ID: <20150616143220.GA14786@edge>
References: <CADnUhn3FrWPH_yUKzX-Tf9Q9vz5GYmDHrVTOQxk_CefMgKvT1A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADnUhn3FrWPH_yUKzX-Tf9Q9vz5GYmDHrVTOQxk_CefMgKvT1A@mail.gmail.com>
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
X-List-Received-Date: Tue, 16 Jun 2015 14:32:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jun 16, 2015 at 12:08:36PM +0300, matti kaasinen wrote:
> Hi!
> Do anyone know how to overriding variables set in arago.conf using
> layer.conf or local.conf settings (or anything else that touching Arago
> layer). I try to set something else on my own layer
> (PREFERRED_VERSION_u-boot). I have tried changing layer orders in
> bblayers.conf and priority in layer.conf. In fact if I got it right from
> Yocto documentation distro.conf is just parsed first and that is what rules.

Actually, it's Distro's job to set preferences, hence it usually sets things 
unconditionally. That's why it's not very easy to override. But it's possible. 
Just use _forcevariable override, e.g. VAR_forcevariable = VAL.

-- 
Denys

