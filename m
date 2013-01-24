Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by arago-project.org (Postfix) with ESMTP id A67FA52A35
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 18:30:17 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MH5000A07E0Y952@vms173003.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 24 Jan 2013 12:30:10 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D8A05201C0; Thu,
	24 Jan 2013 13:29:59 -0500 (EST)
Date: Thu, 24 Jan 2013 13:29:59 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
Message-id: <20130124182959.GB23977@denix.org>
References: <1359037281-12610-1-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1359037281-12610-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: Re: [PATCH 32/47] task-arago-gst: Remove gst-plugins-ugly
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
X-List-Received-Date: Thu, 24 Jan 2013 18:30:18 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline


So, what's with the 32/47 numbering? Is it a continuation of the previous 
series, that ended at 31/31? When properly done, the new series should have 
been a set of 16 patches from 1/16 to 16/16. Or, you should have re-submitted 
both sets in one series of 47 patches, if you wanted...

-- 
Denys


On Thu, Jan 24, 2013 at 08:21:06AM -0600, Franklin S. Cooper Jr wrote:
> * Remove gst-plugins-ugly due to commercial license restrictions
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../tasks/task-arago-gst-sdk-target.bb             |    3 +--
>  .../recipes-core/tasks/task-arago-gst.bb           |    6 ++----
>  2 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-target.bb b/meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-target.bb
> index 06b7184..3a737b1 100644
> --- a/meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-target.bb
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-target.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "Task to build and install header and libs in sdk"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> -PR = "r1"
> +PR = "r2"
>  
>  inherit task
>  
> @@ -10,5 +10,4 @@ RDEPENDS_${PN} = "\
>      gst-plugins-base-dev \
>      gst-plugins-good-dev \
>      gst-plugins-bad-dev \
> -    gst-plugins-ugly-dev \
>  "
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb b/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb
> index b1b8f0b..4ff5494 100644
> --- a/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "Task to add gstreamer and gstreamer plugins"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> -PR = "r1"
> +PR = "r2"
>  
>  inherit task
>  
> @@ -10,12 +10,10 @@ GSTREAMER = " \
>      gst-plugins-base \
>      gst-plugins-good \
>      gst-plugins-bad \
> -    gst-plugins-ugly \
>      gst-plugins-base-meta \
>      gst-plugins-good-meta \
>      gst-plugins-bad-meta \
> -    gst-plugins-ugly-meta \
> -    "
> +"
>  
>  RDEPENDS_${PN} = "\
>      ${GSTREAMER} \
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

