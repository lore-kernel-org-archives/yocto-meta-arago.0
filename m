Return-Path: <denys@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 17CBC52978
	for <meta-arago@arago-project.org>;
	Thu, 13 Jul 2017 21:09:38 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6DL9c91001848;
	Thu, 13 Jul 2017 16:09:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499980178;
	bh=hfW3V+sbm7yY1sRrDkXLQSrq3mGcx+eLyNjsZQHK+aI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Lp0/FVQMKhP5VJY9MVKildfjuFZ7L1jJR2+zcDZVGiUeoMys3pmerr0S8IOMito1a
	1+2W23l7nwBckUbBlUQTWiBjsJ9zvMTbMCShT6q0HxYiuZEjRF+OZspxMBLRSs5mjT
	+pr5JUExWWAt0+y1PJOf131NmvVG78jC1KpKdqQE=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6DL9c2O007177;
	Thu, 13 Jul 2017 16:09:38 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 13 Jul 2017 16:09:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6DL9biO012017;
	Thu, 13 Jul 2017 16:09:37 -0500
Date: Thu, 13 Jul 2017 17:09:35 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: vijaikumar k <vijaikumar.k@mistralsolutions.com>
Message-ID: <20170713210934.GD13353@edge>
References: <CADOTBT0JSbMsc7t71ZYS8MELag6vK2k83BEbcZMtcDGtm-NJpQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADOTBT0JSbMsc7t71ZYS8MELag6vK2k83BEbcZMtcDGtm-NJpQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: Use of repo instead of oe-layersetup script
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
X-List-Received-Date: Thu, 13 Jul 2017 21:09:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sat, Jul 08, 2017 at 10:21:54AM +0530, vijaikumar k wrote:
> Hi All,
> 
> Just wondering, why can't we use repo to clone projects instead of
> oe-layersetup script. We could split the current script into a
> manifest and a env setup script. We could have the env setup script
> inside meta-arago. So the whole command for setting up an Arago
> project would be something like this.
> 
> repo init -u <url>/manifest.git -b arago-morty
> repo sync
> 
> ./sources/meta-arago/env-int.sh

And the counterquestion I have is why should we replace existing method 
with repo? I don't see much difference or benefit. As repo comes from the 
Android world, while it gets used more these days, historically it wasn't 
very popular back then...

-- 
Denys

