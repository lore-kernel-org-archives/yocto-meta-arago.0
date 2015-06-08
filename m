Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 8BEAE529AC
	for <meta-arago@arago-project.org>;
	Mon,  8 Jun 2015 18:22:15 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t58IMBYc022743
	for <meta-arago@arago-project.org>; Mon, 8 Jun 2015 13:22:11 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t58IMB8x007851
	for <meta-arago@arago-project.org>; Mon, 8 Jun 2015 13:22:11 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 8 Jun 2015 13:22:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t58IMBeJ030731;
	Mon, 8 Jun 2015 13:22:11 -0500
Date: Mon, 8 Jun 2015 14:21:55 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150608182154.GD32398@edge>
References: <55759318.1010904@ti.com>
MIME-Version: 1.0
In-Reply-To: <55759318.1010904@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: meta-qt5
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
X-List-Received-Date: Mon, 08 Jun 2015 18:22:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jun 08, 2015 at 09:05:28AM -0400, Jacob Stiffler wrote:
> It appears that the meta-qt5 layer has dropped the 5.4.1 versioned
> recipes. This means that the meta-arago bbappends no longer apply.
> 
> I see there is a history of meta-arago using the versioned recipes,
> but these are no longer there, and only the git based recipes
> remain.
> 
> I'm not sure of the impact there would be in moving the meta-arago
> appends to the git based recipes. I'll give this a try and provide
> an update later.

Yeah, saw this last week, but haven't had a chance to fix it.

What I'm thinking is there are 2 options:

1. Rename bbappends from 5.4.1 to git - seems to build fine locally here.

2. Lock meta-qt5 on the commit before 5.4.1 got removed - it won't get much 
better in 5.4.x branch and we are waiting for 5.5 to get better Touchscreen 
support. We can keep using meta-qt5/master in meta-arago/master, but lock 
meta-arago/daisy to 5.4.1, which is what has been tested so far. This seems 
safer for the release...

Thoughts?

-- 
Denys

