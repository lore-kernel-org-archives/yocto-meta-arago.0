Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 0676852972
	for <meta-arago@arago-project.org>;
	Tue, 30 Sep 2014 21:17:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8ULHJqi011901
	for <meta-arago@arago-project.org>; Tue, 30 Sep 2014 16:17:19 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8ULHJVx024727
	for <meta-arago@arago-project.org>; Tue, 30 Sep 2014 16:17:19 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 30 Sep 2014 16:17:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8ULHIMb027944;
	Tue, 30 Sep 2014 16:17:18 -0500
Date: Tue, 30 Sep 2014 17:17:18 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20140930211718.GS6303@edge>
References: <1411487426-31949-1-git-send-email-a0393906@ti.com>
	<1411487426-31949-5-git-send-email-a0393906@ti.com>
	<20140923155711.GL6303@edge> <5422B3AB.7040106@ti.com>
MIME-Version: 1.0
In-Reply-To: <5422B3AB.7040106@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [for master 4/5] example-applications: Adding repository of GLSDK example applications
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
X-List-Received-Date: Tue, 30 Sep 2014 21:17:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Sep 24, 2014 at 05:36:03PM +0530, Karthik Ramanan wrote:
> On 23-Sep-14 9:27 PM, Denys Dmytriyenko wrote:
> >Are those specific to GLSDK or OMAP5/DRA7 platforms? If so, should we name the
> >recipe differently? The git repo has more specific hierarchy -
> >glsdk/example-applications, should the recipe be more specific too?
> >
> Denys,
> 
> We are using this git repository as a place holder for all kinds of
> tests and some of them are very dra7xx specific. So its definitely
> not possible to say its generic or even its specific to the
> platform. But for now we can say that this is GLSDK specific.
> 
> Do you have any suggestions to handle this scenario?
> 
> I can see that it has to be renamed to make it apparent that it is
> GLSDK specific.

Can you call it as "glsdk-examples" or "glsdk-example-apps" or something along 
those lines? We can look into making those generic or consolidating with other 
later...

-- 
Denys

