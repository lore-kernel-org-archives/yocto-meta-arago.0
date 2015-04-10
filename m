Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 47C31529AF
	for <meta-arago@arago-project.org>;
	Fri, 10 Apr 2015 17:44:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3AHiO1g027829
	for <meta-arago@arago-project.org>; Fri, 10 Apr 2015 12:44:24 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3AHiNML015488
	for <meta-arago@arago-project.org>; Fri, 10 Apr 2015 12:44:23 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Apr 2015 12:44:22 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3AHiM4j007687;
	Fri, 10 Apr 2015 12:44:22 -0500
Date: Fri, 10 Apr 2015 13:44:22 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20150410174422.GA9147@edge>
References: <1428582873-438-1-git-send-email-a0393906@ti.com>
	<20150409211614.GB6414@edge> <5527C7A0.80700@ti.com>
MIME-Version: 1.0
In-Reply-To: <5527C7A0.80700@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: weston: Add custom profile into targetfs
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
X-List-Received-Date: Fri, 10 Apr 2015 17:44:25 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Apr 10, 2015 at 06:22:48PM +0530, Karthik Ramanan wrote:
> On 10-Apr-15 2:46 AM, Denys Dmytriyenko wrote:
> >Karthik,
> >
> >Looks better. Now, can you just merge the existing wayland_env and the new
> >profile you are adding? Both of them are installed in /etc/profile.d and get
> >sourced on every login. Just add the mkdir and chmod part to the end of
> >existing wayland_env.sh and that's it. Also, since you are changing wayldn_env
> >file anyway, set XDG_RUNTIME_DIR to the same value of /tmp/${UID}-runtime-dir?
> >
> 
> Denys,
> 
> Thanks for the feedback. I have incorporated all the suggestions in
> PATCH v3.

Thanks, looks good!

-- 
Denys

