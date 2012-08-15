Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by arago-project.org (Postfix) with ESMTP id CE08452986
	for <meta-arago@arago-project.org>;
	Wed, 15 Aug 2012 19:36:30 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M8T00EE0AG8G082@vms173003.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 15 Aug 2012 14:36:09 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7DE7B201AC; Wed,
	15 Aug 2012 15:36:08 -0400 (EDT)
Date: Wed, 15 Aug 2012 15:36:08 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Franklin S Cooper Jr <fcooper@ti.com>
Message-id: <20120815193608.GB7503@denix.org>
References: <1344888323-30885-1-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1344888323-30885-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] meta-arago-upstream: Create new upstream layer
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
X-List-Received-Date: Wed, 15 Aug 2012 19:36:31 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Aug 13, 2012 at 03:05:23PM -0500, Franklin S Cooper Jr wrote:
> * This patch creates a new layer called meta-arago-upstream. The purpose
>   of this layer is store needed changes that were pulled from the applicable
>   master branch but can't be pulled into the corresponding maintenance branch.
> * Once meta-arago tracks a new maintenance branch, the contents of this layer
>   should be cleared since all the changes pulled into this layer should be
>   located in the new maintenance branch.

I'm thinking creating a separate layer for tracking changes might be an 
overkill... Can we put the psplash fix in the meta-arago-distro/master for 
now? Let's see how many of those we would need - so far there's only couple of 
such bbappends or changes that are already in oe-core/master, but needed for 
denzil. If the number starts growing rapidly, we'll look into a separate 
"next" branch or even a layer...

Denys


> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> ---
>  meta-arago-upstream/COPYING.MIT     |   17 +++++++++++++++++
>  meta-arago-upstream/README          |   26 ++++++++++++++++++++++++++
>  meta-arago-upstream/conf/layer.conf |    9 +++++++++
>  3 files changed, 52 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-upstream/COPYING.MIT
>  create mode 100644 meta-arago-upstream/README
>  create mode 100644 meta-arago-upstream/conf/layer.conf
> 
> diff --git a/meta-arago-upstream/COPYING.MIT b/meta-arago-upstream/COPYING.MIT
> new file mode 100644
> index 0000000..fb950dc
> --- /dev/null
> +++ b/meta-arago-upstream/COPYING.MIT
> @@ -0,0 +1,17 @@
> +Permission is hereby granted, free of charge, to any person obtaining a copy 
> +of this software and associated documentation files (the "Software"), to deal 
> +in the Software without restriction, including without limitation the rights 
> +to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
> +copies of the Software, and to permit persons to whom the Software is 
> +furnished to do so, subject to the following conditions:
> +
> +The above copyright notice and this permission notice shall be included in 
> +all copies or substantial portions of the Software.
> +
> +THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
> +IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
> +FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
> +AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
> +LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
> +OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
> +THE SOFTWARE.
> diff --git a/meta-arago-upstream/README b/meta-arago-upstream/README
> new file mode 100644
> index 0000000..38416f8
> --- /dev/null
> +++ b/meta-arago-upstream/README
> @@ -0,0 +1,26 @@
> +meta-arago-upstream provides a place to store changes that were upstreamed but aren't
> +currently located in the applicable maintenance branch.
> +
> +Once meta-arago tracks a new maintenance branch, the contents of this layer should be 
> +cleared since all the changes pulled into this layer should be located in the new 
> +maintenance branch.
> +
> +This layer works with the latest Yocto Project release (currently 1.2) and tracks
> +the stable/maintenance branches (currently "denzil") of the corresponding layers:
> +
> +URI: git://git.openembedded.org/openembedded-core
> +branch: denzil
> +revision: HEAD
> +
> +URI: git://git.openembedded.org/meta-openembedded
> +branch: denzil
> +revision: HEAD
> +
> +URI: git://arago-project.org/git/meta-ti
> +branch: denzil
> +revision: HEAD
> +
> +Send pull requests to meta-arago@arago-project.org
> +
> +Layer maintainers: Chase Maupin <chase.maupin@ti.com>
> +                   Denys Dmytriyenko <denys@ti.com>
> diff --git a/meta-arago-upstream/conf/layer.conf b/meta-arago-upstream/conf/layer.conf
> new file mode 100644
> index 0000000..87b6c8c
> --- /dev/null
> +++ b/meta-arago-upstream/conf/layer.conf
> @@ -0,0 +1,9 @@
> +# We have a conf and classes directory, append to BBPATH
> +BBPATH .= ":${LAYERDIR}"
> +
> +# We have a recipes directory, add to BBFILES
> +BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
> +
> +BBFILE_COLLECTIONS += "meta-arago-upstream"
> +BBFILE_PATTERN_meta-arago-upstream := "^${LAYERDIR}/"
> +BBFILE_PRIORITY_meta-arago-upstream = "10"
> -- 
> 1.7.7
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

