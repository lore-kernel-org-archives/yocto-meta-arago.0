Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id E5C5E52961
	for <meta-arago@arago-project.org>;
	Mon,  1 Feb 2016 21:59:13 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u11LxAf0005940;
	Mon, 1 Feb 2016 15:59:10 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u11LxA3Q030028;
	Mon, 1 Feb 2016 15:59:10 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 1 Feb 2016 15:59:10 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u11Lx9HX023128;
	Mon, 1 Feb 2016 15:59:10 -0600
Date: Mon, 1 Feb 2016 16:58:54 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Message-ID: <20160201215854.GU11314@edge>
References: <CADySD0FB8Y_f9SWK+=WDmb8tba=mUZ==PK-spO+_BOhR4QhVsQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADySD0FB8Y_f9SWK+=WDmb8tba=mUZ==PK-spO+_BOhR4QhVsQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: What's the reason behind different config file in oe-layersetup
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
X-List-Received-Date: Mon, 01 Feb 2016 21:59:14 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Feb 02, 2016 at 10:45:43AM +1300, Ankur Tyagi wrote:
> Hi,
> 
> oe-layersetup has different set of configs. I couldn't find any
> documentation explaining "when to use which config".
> 
> Can someone help me understand the rationale behind these configs ? They
> all refer to different commits of same repo, so I am sure there must a
> reason behind it.

http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment

Available Layer Configurations section explains what those configs are.

To summarize - config files in the main configs/ directory are all "rolling", 
i.e. they pull latest from corresponding branches of all the layers. Useful 
for development. On the other hand, configs in coresdk, amsdk, glsdk, mcsdk 
and processor-sdk directories are the release configs, i.e. they pin down all 
the layers to a specific commit ID at the time of release. That way a given 
release can be reproduced later on. And those SDK names are just product names 
to support corresponding TI embedded processor platforms.


> For a commercial product, which config should be used to create bsp, kernel
> and rootfs

For your own commercial product, you should create your own config, using one 
of the existing ones as an example.

-- 
Denys

