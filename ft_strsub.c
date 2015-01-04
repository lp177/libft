/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strsub.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: luperez <luperez@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2014/11/15 19:23:34 by luperez           #+#    #+#             */
/*   Updated: 2014/11/19 07:35:32 by luperez          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strsub(char const *s, unsigned int start, size_t len)
{
	int		i;
	char	*move;
	char	*sub;

	if (start == '\0' && len == 0)
		return (ft_strnew(1));
	if (s == NULL || start < 1 || len < 1)
		return (NULL);
	i = -1;
	if (len > 0)
		sub = (char *)malloc(sizeof(char) * len + 1);
	if (sub == NULL)
		return (NULL);
	move = (char *)&s[start];
	while (len--)
	{
		i++;
		sub[i] = move[i];
	}
	sub[++i] = '\0';
	return (sub);
}
