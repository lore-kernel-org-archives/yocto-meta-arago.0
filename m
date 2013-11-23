Return-Path: <tom.rini@gmail.com>
Received: from mail-qe0-f43.google.com (mail-qe0-f43.google.com
	[209.85.128.43])
	by arago-project.org (Postfix) with ESMTPS id BEDA452986
	for <meta-arago@arago-project.org>;
	Sat, 23 Nov 2013 02:15:35 +0000 (UTC)
Received: by mail-qe0-f43.google.com with SMTP id 2so1623072qeb.16
	for <meta-arago@arago-project.org>;
	Fri, 22 Nov 2013 18:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=KAxDlAH00kxtbPIkIlx3ClVUwPiJ4fYTSS2Xz4kAcKQ=;
	b=kCYOOmtw1juKDp/UCbLM8r2zYA2bDMgI7GqErIl/W5tGBawepoOjBdOWmra7ej+8XX
	YCg7NpF17q3YPrV+RVclejEjLIVqnl+mTWeIYjZIyc2ZAvL49j1mjsq0ABxqf8nua/+L
	6ZOVwcpr9MYvqrmRQ/bpK9nK/zFqHvm/oeR6LfI4f0cfjYNvotyAmumfmDDwLfnvLbCT
	w7Dep27skXR44GNSaUbwaaG5FDeke+JJENRpHkgDbCxO1CN7qTXlgSnhnkNxMzoB6AHH
	rTzBjU+Wm4fXKQ6wwp1RhSyNSHDmIyFNXkAyvPzzwzK+yjOduCA+xd1LxAA2hI8MrfSU
	CG9g==
X-Received: by 10.224.29.66 with SMTP id p2mr8560001qac.82.1385172935017;
	Fri, 22 Nov 2013 18:15:35 -0800 (PST)
Received: from bill-the-cat (cpe-174-106-216-211.ec.res.rr.com.
	[174.106.216.211])
	by mx.google.com with ESMTPSA id x10sm10794575qas.5.2013.11.22.18.15.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 22 Nov 2013 18:15:34 -0800 (PST)
Sender: Tom Rini <tom.rini@gmail.com>
Date: Fri, 22 Nov 2013 21:15:45 -0500
From: Tom Rini <trini@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20131123021545.GV420@bill-the-cat>
References: <1385135121-14345-1-git-send-email-fcooper@ti.com>
	<1385135121-14345-5-git-send-email-fcooper@ti.com>
	<20131122200029.GT420@bill-the-cat>
	<8F29D6B095ED194EA1980491A5E029710C5C059E@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C5C059E@DFLE08.ent.ti.com>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 5/6] mount-sdcard: Update to use new udev entry
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
X-List-Received-Date: Sat, 23 Nov 2013 02:15:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 22, 2013 at 10:27:06PM +0000, Cooper Jr., Franklin wrote:
> 
> 
> > -----Original Message-----
> > From: Tom Rini [mailto:tom.rini@gmail.com] On Behalf Of Rini, Tom
> > Sent: Friday, November 22, 2013 2:00 PM
> > To: Cooper Jr., Franklin
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH 5/6] mount-sdcard: Update to use new udev
> > entry
> > 
> > On Fri, Nov 22, 2013 at 09:45:20AM -0600, Franklin S. Cooper Jr wrote:
> > 
> > > * Patch 1c1b695310309ec3526f1b6b415c5e1b74a567e1 added a udev
> > entry to
> > >   automatically mount sd card partition.
> > > * For some reason that udev entry isn't automatically ran.
> > > * As a workaround manually trigger udev to run twice (not sure why thats
> > needed)
> > >   for the udev rule to run correctly.
> > >
> > > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > 
> > This issn't right.  Have you added debugging steps to the mount.sh script?
> > We're saying, with this change "lets trigger all block devices 3 times", and on the
> > 3rd attempt we finally do mount things.  I've seen some partitions NOT be auto-
> > mounted due to being dirty and needing an fsck prior to mounting them.  If we
> > need to do this type of change at the end as a "we can't figure out the root
> > cause, but we need to release", OK.
> > But I don't think we're there yet.  Thanks!
> [Franklin] Just to give an update it looks like fsck is required to be ran to fix this problem however it wouldn't be safe to run fsck and let it auto fix the problem since that could cause potential issues. So if fsck is really the proper solution then I'm not sure that would work for something that needs to automatically work at bootup. 

Well, dirty cards shouldn't be auto-mounted.  Or there's some option to
mount we should be passing to say "no, it's OK".

-- 
Tom

